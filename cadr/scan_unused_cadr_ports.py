#!/usr/bin/env python3
"""
Script to scan for unused ports in CADR components.
Compares port declarations in cadr_book.vhd and icmem_book.vhd 
with their usage in corresponding SUDS architecture files.
"""

import re
import os
import sys
from pathlib import Path
from typing import Dict, List, Set, Tuple
from datetime import datetime

def extract_component_ports(book_file: str) -> Dict[str, List[str]]:
    """Extract component names and their ports from book files."""
    components = {}
    
    with open(book_file, 'r') as f:
        content = f.read()
    
    # Find all component declarations
    component_pattern = r'component\s+(\w+)\s+is\s*port\s*\((.*?)\);\s*end\s+component;'
    matches = re.findall(component_pattern, content, re.DOTALL | re.IGNORECASE)
    
    for comp_name, port_section in matches:
        ports = []
        # Extract individual port declarations
        port_lines = port_section.split(';')
        for line in port_lines:
            line = line.strip()
            if line and ':' in line:
                # Extract port name (handle escaped names with backslashes)
                # Match patterns like: portname, \-portname\, \portname\
                port_match = re.match(r'\s*(\\?[^\\:\s]+\\?)\s*:', line)
                if port_match:
                    port_name = port_match.group(1).strip()
                    ports.append(port_name)
        
        components[comp_name] = ports
    
    return components

def extract_suds_port_usage(suds_file: str) -> Set[str]:
    """Extract all port names used in a SUDS architecture file."""
    used_ports = set()
    
    if not os.path.exists(suds_file):
        return used_ports
    
    with open(suds_file, 'r') as f:
        content = f.read()
    
    # Find all port map statements
    port_map_pattern = r'port\s+map\s*\((.*?)\)'
    matches = re.findall(port_map_pattern, content, re.DOTALL | re.IGNORECASE)
    
    for port_map in matches:
        # Extract port assignments like "p1 => signal_name"
        # Handle both regular and escaped signal names
        assignments = re.findall(r'p\d+\s*=>\s*([^,\)]+)', port_map)
        for signal in assignments:
            signal = signal.strip()
            # Skip constants and open connections
            if signal not in ['open', "'0'", "'1'", 'gnd']:
                # Handle escaped signal names - remove outer backslashes but keep inner content
                if signal.startswith('\\') and signal.endswith('\\'):
                    signal = signal[1:-1]  # Remove outer backslashes
                elif signal.startswith('\\'):
                    signal = signal[1:]    # Remove leading backslash
                elif signal.endswith('\\'):
                    signal = signal[:-1]   # Remove trailing backslash
                
                used_ports.add(signal)
    
    return used_ports

def normalize_port_name(port_name: str) -> str:
    """Normalize port names for comparison."""
    # Remove outer backslashes for comparison
    if port_name.startswith('\\') and port_name.endswith('\\'):
        return port_name[1:-1]
    return port_name

def find_unused_ports():
    """Main function to find unused ports in CADR components."""
    script_dir = Path(__file__).parent
    
    # Extract components from book files
    print("Extracting component definitions...")
    cadr_components = extract_component_ports(script_dir / 'cadr_book.vhd')
    icmem_components = extract_component_ports(script_dir / 'icmem_book.vhd')
    
    all_components = {**cadr_components, **icmem_components}
    
    print(f"Found {len(all_components)} components")
    
    unused_ports_report = {}
    components_without_suds = []
    
    for comp_name, declared_ports in all_components.items():
        suds_file = script_dir / f'{comp_name}_suds.vhd'
        
        if suds_file.exists():
            print(f"Analyzing {comp_name}...")
            used_ports = extract_suds_port_usage(suds_file)
            
            # Normalize port names for comparison
            declared_normalized = {normalize_port_name(p) for p in declared_ports}
            used_normalized = {normalize_port_name(p) for p in used_ports}
            
            # Find unused ports
            unused_ports = declared_normalized - used_normalized
            
            if unused_ports:
                # Map back to original port names for reporting
                unused_original = []
                for unused in unused_ports:
                    for orig_port in declared_ports:
                        if normalize_port_name(orig_port) == unused:
                            unused_original.append(orig_port)
                            break
                
                unused_ports_report[comp_name] = {
                    'declared': len(declared_ports),
                    'used': len(used_normalized),
                    'unused': sorted(unused_original)
                }
        else:
            components_without_suds.append(comp_name)
    
    # Generate report
    report_lines = []
    report_lines.append("="*80)
    report_lines.append("UNUSED PORTS REPORT")
    report_lines.append(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    report_lines.append("="*80)
    
    if not unused_ports_report:
        report_lines.append("No unused ports found in any component!")
    else:
        total_unused = 0
        
        # Sort by number of unused ports (descending)
        sorted_components = sorted(unused_ports_report.items(), 
                                 key=lambda x: len(x[1]['unused']), 
                                 reverse=True)
        
        for comp_name, info in sorted_components:
            report_lines.append(f"\nComponent: {comp_name}")
            report_lines.append(f"  Declared ports: {info['declared']}")
            report_lines.append(f"  Used ports: {info['used']}")
            unused_list = ', '.join(info['unused'])
            if len(unused_list) > 100:  # Wrap long lines
                report_lines.append(f"  Unused ports ({len(info['unused'])}):")
                for port in info['unused']:
                    report_lines.append(f"    {port}")
            else:
                report_lines.append(f"  Unused ports ({len(info['unused'])}): {unused_list}")
            total_unused += len(info['unused'])
        
        report_lines.append(f"\nSUMMARY:")
        report_lines.append(f"  Components analyzed: {len(all_components) - len(components_without_suds)}")
        report_lines.append(f"  Components with unused ports: {len(unused_ports_report)}")
        report_lines.append(f"  Total unused ports: {total_unused}")
        
        # Top offenders
        if len(sorted_components) > 0:
            report_lines.append(f"\nTOP COMPONENTS WITH MOST UNUSED PORTS:")
            for comp_name, info in sorted_components[:10]:  # Top 10
                report_lines.append(f"  {comp_name}: {len(info['unused'])} unused ports")
    
    if components_without_suds:
        report_lines.append(f"\nCOMPONENTS WITHOUT SUDS FILES ({len(components_without_suds)}):")
        for comp in sorted(components_without_suds):
            report_lines.append(f"  {comp}")
    
    # Print to console
    for line in report_lines:
        print(line)
    
    # Save to file
    output_file = script_dir / 'unused_ports_report.txt'
    with open(output_file, 'w') as f:
        f.write('\n'.join(report_lines))
    
    print(f"\nReport saved to: {output_file}")

if __name__ == "__main__":
    find_unused_ports() 