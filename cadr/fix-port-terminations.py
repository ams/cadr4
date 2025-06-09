#!/usr/bin/env python3

import re
import sys
import os

# --- Parsing dip.vhd ---

def parse_dip_vhd(dip_vhd_path):
    """
    Parses the dip.vhd file to extract component definitions, including ports and aliases.
    """
    components = {}
    aliases = {}
    try:
        with open(dip_vhd_path, 'r') as f:
            content = f.read()
    except FileNotFoundError:
        print(f"Error: {dip_vhd_path} not found.", file=sys.stderr)
        sys.exit(1)

    # Regex to find components and their ports
    component_regex = re.compile(r'component\s+(\w+)\s+is\s+port\s*\((.*?)\);', re.DOTALL)
    port_regex = re.compile(r'(\w+)\s*:\s*(in|out|inout|buffer)\s+std_logic', re.IGNORECASE)
    
    for match in component_regex.finditer(content):
        comp_name = match.group(1)
        ports_str = match.group(2)
        ports = {}
        for port_match in port_regex.finditer(ports_str):
            port_name = port_match.group(1).lower()
            port_dir = port_match.group(2).lower()
            ports[port_name] = port_dir
        components[comp_name.lower()] = ports

    # Regex for aliases (e.g., component sn74ls244 is new dip_74ls244 port map)
    alias_regex = re.compile(r'component\s+([\w\d]+)\s+is\s+new\s+([\w\d]+)\s+port\s+map', re.IGNORECASE)
    for match in alias_regex.finditer(content):
        alias_name = match.group(1).lower()
        original_name = match.group(2).lower()
        aliases[alias_name] = original_name

    return components, aliases

# --- Processing SUDS VHD file ---

def process_suds_vhd(suds_vhd_path, components, aliases):
    """
    Processes a _suds.vhd file to fix unmapped ports.
    """
    try:
        with open(suds_vhd_path, 'r') as f:
            content = f.read()
    except FileNotFoundError:
        print(f"Error: {suds_vhd_path} not found.", file=sys.stderr)
        sys.exit(1)

    # Regex to find instantiations. This is complex because port maps can span lines.
    # We find the start and then look for the closing ');'
    inst_regex = re.compile(r'(\w+\s*:\s*[\w\d_]+\s+port\s+map\s*\()', re.IGNORECASE)

    new_content = content
    offset = 0

    for match in inst_regex.finditer(content):
        start_index = match.end(1)
        
        # Find the component name from the match
        header = match.group(1)
        comp_name_match = re.search(r':\s*(\S+)\s+port', header, re.IGNORECASE)
        if not comp_name_match:
            continue
        
        comp_name = comp_name_match.group(1).lower()
        
        # Resolve alias if necessary
        actual_comp_name = aliases.get(comp_name, comp_name)

        if not actual_comp_name.startswith('dip_'):
            continue

        if actual_comp_name not in components:
            print(f"Warning: Component '{actual_comp_name}' not found in dip.vhd.", file=sys.stderr)
            continue
            
        all_ports = components[actual_comp_name]
        
        # Find the end of the port map
        brace_level = 1
        end_index = -1
        # Search for the end of the port map, which is a closing parenthesis followed by a semicolon
        search_str = content[start_index:]
        end_match = re.search(r'\);', search_str)

        if not end_match:
            print(f"Warning: Could not find closing ');' for instantiation starting with: {header}", file=sys.stderr)
            continue

        end_index = start_index + end_match.start()

        port_map_str = content[start_index:end_index]

        # Extract existing port mappings
        port_map_regex = re.compile(r'(\w+)\s*=>', re.IGNORECASE)
        mapped_ports = {p.lower() for p in port_map_regex.findall(port_map_str)}
        
        # Find unmapped ports
        unmapped_ports = set(all_ports.keys()) - mapped_ports

        if not unmapped_ports:
            continue

        # Build new port mappings
        new_mappings = []
        for port in sorted(list(unmapped_ports)):
            direction = all_ports[port]
            if direction == 'in' or direction == 'inout' or direction == 'buffer':
                new_mappings.append(f"{port} => '0'")
            elif direction == 'out':
                new_mappings.append(f"{port} => open")
        
        new_mappings_str = ", ".join(new_mappings)

        # Construct the new port map string
        # Add a comma if there were existing mappings and we are adding new ones
        separator = ""
        if port_map_str.strip() and new_mappings_str:
            separator = ", "

        updated_port_map_str = port_map_str.strip() + separator + new_mappings_str
        
        # Replace the old port map in the content
        original_instantiation = content[match.start(1):end_index+2]
        new_instantiation = f"{match.group(1)}{updated_port_map_str});"
        
        # To avoid issues with multiple identical instantiations, we replace one at a time
        # using the start and end indices of the full match.
        full_original = content[match.start(0):end_index+2]
        
        # Re-create the new instantiation with the label.
        label = match.group(0).split(':')[0].strip()
        new_full_instantiation = f"{label} : {comp_name_match.group(1)} port map ({updated_port_map_str});"

        # A simple string replacement could fail if there are identical instantiations.
        # Let's replace in the `new_content` which is being modified iteratively.
        old_full_inst_in_new_content = new_content[match.start(0) + offset : end_index + 2 + offset]
        
        # Need to re-find the port map within the full instantiation string
        port_map_part_match = re.search(r'port\s+map\s*\((.*)\);', old_full_inst_in_new_content, re.DOTALL | re.IGNORECASE)
        
        if not port_map_part_match:
            continue

        old_port_map_str_with_parens = port_map_part_match.group(0)
        new_port_map_str_with_parens = f"port map ({updated_port_map_str});"
        
        # Let's use more specific regex for replacement to preserve formatting as much as possible.
        current_inst_text = content[match.start(0):end_index+2]
        new_inst_text = current_inst_text.replace(port_map_part_match.group(1), updated_port_map_str)

        # We do a one-time replacement in the whole `new_content` string.
        # This is simpler and less error-prone than managing offsets of multiple replacements.
        # However, it fails if there are multiple identical instantiations.
        # A better way is to rebuild the string.
        # Let's stick to a simpler approach first.

    # A more robust replacement strategy: iterate through matches and build a new string.
    last_end = 0
    final_content = []
    
    # Redo the matching on the original content to be safe.
    inst_regex_for_replace = re.compile(r'(\w+\s*:\s*[\w\d_]+\s+port\s+map\s*\()(.*?)(\);)', re.DOTALL | re.IGNORECASE)

    for match in inst_regex_for_replace.finditer(content):
        header_part = match.group(1) # The part before port list, e.g. "inst : comp port map ("
        port_map_part = match.group(2) # just the port list
        footer_part = match.group(3) # ");"

        comp_name_match = re.search(r':\s*(\S+)\s+port', header_part, re.IGNORECASE)
        if not comp_name_match:
            continue

        comp_name = comp_name_match.group(1).lower()
        actual_comp_name = aliases.get(comp_name, comp_name)

        if not actual_comp_name.startswith('dip_'):
            continue
        
        if actual_comp_name not in components:
            continue

        all_ports = components[actual_comp_name]
        port_map_regex = re.compile(r'(\w+)\s*=>', re.IGNORECASE)
        mapped_ports = {p.lower() for p in port_map_regex.findall(port_map_part)}
        unmapped_ports = set(all_ports.keys()) - mapped_ports

        if not unmapped_ports:
            continue

        new_mappings = []
        # Sort by pin number to have a consistent order
        for port in sorted(list(unmapped_ports), key=lambda p: int(re.search(r'(\d+)', p).group(1))):
            direction = all_ports[port]
            if direction in ('in', 'inout', 'buffer'):
                new_mappings.append(f"{port} => '0'")
            elif direction == 'out':
                new_mappings.append(f"{port} => open")
        
        # Combine existing and new mappings and sort them
        existing_mappings = [m.strip() for m in port_map_part.split(',') if m.strip()]
        all_map_items = existing_mappings + new_mappings
        
        def get_port_num(mapping_str):
            # Extract port number for sorting, e.g., p1 -> 1
            match = re.match(r'p(\d+)', mapping_str.strip().lower())
            return int(match.group(1)) if match else float('inf')

        # To preserve comments or complex formatting, we don't reformat the whole thing.
        # We just append the new mappings.
        if port_map_part.strip() and not port_map_part.strip().endswith(','):
            port_map_part += ','

        # Add new mappings to the existing port map string
        updated_port_map_str = port_map_part + " " + ", ".join(new_mappings)

        # Let's try the full sorted approach again, it's cleaner
        sorted_mappings = sorted(all_map_items, key=get_port_num)
        
        updated_port_map_str = ", ".join(sorted_mappings)

        new_instantiation_str = f"{header_part}{updated_port_map_str}{footer_part}"

        final_content.append(content[last_end:match.start(0)])
        final_content.append(new_instantiation_str)
        last_end = match.end(0)

    final_content.append(content[last_end:])
    
    modified_content = "".join(final_content)

    if modified_content != content:
        try:
            with open(suds_vhd_path, 'w') as f:
                f.write(modified_content)
        except IOError as e:
            print(f"Error writing to {suds_vhd_path}: {e}", file=sys.stderr)
            sys.exit(1)

    return 0

def main():
    if len(sys.argv) != 2:
        print("Usage: ./fix-port-terminations.py <path_to_suds_vhd_file>", file=sys.stderr)
        sys.exit(1)

    suds_vhd_path = sys.argv[1]
    
    # Assume dip.vhd is in ../dip relative to this script
    script_dir = os.path.dirname(os.path.abspath(__file__))
    dip_vhd_path = os.path.join(script_dir, '..', 'dip', 'dip.vhd')

    components, aliases = parse_dip_vhd(dip_vhd_path)
    if not components:
        sys.exit(1)
    
    process_suds_vhd(suds_vhd_path, components, aliases)
    sys.exit(0)


if __name__ == '__main__':
    main() 