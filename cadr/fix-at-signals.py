import sys
import re
import os

def fix_vhdl_file(filepath):
    try:
        with open(filepath, 'r') as f:
            content = f.read()
    except FileNotFoundError:
        print(f"Error: File not found at {filepath}", file=sys.stderr)
        sys.exit(1)

    filename = os.path.basename(filepath)
    match = re.match(r'(.+)_suds\.vhd', filename)
    if not match:
        print(f"Error: Filename '{filename}' does not match expected pattern 'X_suds.vhd'", file=sys.stderr)
        sys.exit(1)
    
    entity_base_name = match.group(1)

    at_signal_regex = r'\\@([a-zA-Z0-9_]+),p([0-9]+)\\'
    at_signals = set(re.findall(at_signal_regex, content))

    if not at_signals:
        # No changes needed
        sys.exit(0)

    # 1. Add signal declarations
    signal_declarations = []
    for designator, pin_num in at_signals:
        signal_name = f"\\@{designator},p{pin_num}\\"
        signal_declarations.append(f"signal {signal_name} : std_logic;")
    
    declarations_str = "\n".join(signal_declarations)

    # Find position to insert declarations
    arch_begin_match = re.search(r'^(architecture\s+.*\s+is)$', content, re.MULTILINE | re.IGNORECASE)
    if not arch_begin_match:
        arch_begin_match = re.search(r'^(architecture\s+.*\s+of\s+.*\s+is)$', content, re.MULTILINE | re.IGNORECASE)

    if not arch_begin_match:
        print("Error: Could not find architecture declaration.", file=sys.stderr)
        sys.exit(1)

    insertion_point = arch_begin_match.end()
    modified_content = content[:insertion_point] + "\n" + declarations_str + "\n" + content[insertion_point:]
    
    # 2. Fix port maps
    # This is complex because we are modifying the string as we iterate
    # We should do a pass for each signal
    
    new_content = modified_content
    
    for designator, pin_num in at_signals:
        component_label = f"{entity_base_name}_{designator}"
        
        # Regex to find the whole component instantiation block, robust against multi-line.
        # It looks for `component_label : component_type port map (...) ;`
        # This is tricky with re.
        # Let's try to find the line and then modify it.
        # This assumes the port map is on a single line which seems to be the case in the example.
        
        # A simplified assumption: the component instantiation is on one line.
        # A more robust way would be to find the component label, then find "port map"
        
        inst_regex = re.compile(r"(\b" + re.escape(component_label) + r"\b.*?port\s+map\s*\([^;]+\);)", re.IGNORECASE | re.DOTALL)
        
        inst_match = inst_regex.search(new_content)
        
        if not inst_match:
            print(f"Error: Could not find component instantiation for label '{component_label}'", file=sys.stderr)
            # We can choose to continue or fail. Let's fail.
            sys.exit(1)
            
        instantiation_block = inst_match.group(1)
        
        port_pin_regex = re.compile(r"(p" + pin_num + r"\s*=>\s*)(\w+|\\.*?\\)", re.IGNORECASE)
        
        at_signal_name = f"\\@{designator},p{pin_num}\\"
        
        # We need to escape backslashes for the replacement string in re.sub
        escaped_at_signal_name = at_signal_name.replace('\\', '\\\\')

        new_instantiation_block, count = port_pin_regex.subn(r"\g<1>" + escaped_at_signal_name, instantiation_block)
        
        if count == 0:
            print(f"Error: Could not find pin 'p{pin_num}' in port map for '{component_label}'", file=sys.stderr)
            sys.exit(1)

        new_content = new_content.replace(instantiation_block, new_instantiation_block)

    with open(filepath, 'w') as f:
        f.write(new_content)

    sys.exit(0)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python fix-at-signals.py <path_to_vhdl_file>", file=sys.stderr)
        sys.exit(1)
    
    fix_vhdl_file(sys.argv[1]) 