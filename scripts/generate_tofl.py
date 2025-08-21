#!/usr/bin/env python3
"""
Generate a topologically sorted list of VHDL files based on their dependencies.

This script creates a directed dependency graph where each VHDL file is a node,
and an edge from A to B means A depends on B. It then performs a topological
sort to output files in dependency order (files with no dependencies first).
"""

import re
import sys
import argparse
import glob
from pathlib import Path
from typing import Set, Dict, List
from collections import defaultdict, deque


def extract_vhdl_dependencies(file_path: Path) -> Set[str]:
    """
    Extract dependencies from a VHDL file by finding entity and component instantiations.
    
    Returns a set of entity/component names that this file depends on.
    """
    dependencies = set()
    
    try:
        with open(file_path, 'r') as f:
            content = f.read()
    except Exception as e:
        print(f"Warning: Could not read {file_path}: {e}", file=sys.stderr)
        return dependencies
    
    # Remove VHDL comments (-- to end of line)
    # Be careful with extended identifiers (\...\)
    def remove_comments(text):
        lines = text.split('\n')
        result_lines = []
        for line in lines:
            # Handle extended identifiers by preserving them
            if '\\' in line:
                # Split by extended identifiers and process each part
                parts = re.split(r'(\\[^\\]*\\)', line)
                result_parts = []
                for part in parts:
                    if part.startswith('\\') and part.endswith('\\'):
                        # This is an extended identifier, keep it as-is
                        result_parts.append(part)
                    else:
                        # This is regular content, remove comments
                        result_parts.append(re.sub(r'--.*', '', part))
                result_lines.append(''.join(result_parts))
            else:
                # No extended identifiers, safe to remove comments normally
                result_lines.append(re.sub(r'--.*', '', line))
        return '\n'.join(result_lines)
    
    content = remove_comments(content)
    
    # Find entity instantiations: entity work.entity_name port map
    # Pattern: entity work.name port map or entity name port map
    entity_pattern = r'entity\s+(?:work\.)?(\w+)\s+port\s+map'
    for match in re.finditer(entity_pattern, content, re.IGNORECASE):
        entity_name = match.group(1)
        dependencies.add(entity_name)
    
    # Find component instantiations: label : component_name [generic map (...)] port map
    # Pattern: label : component_name followed by either port map or generic map then port map
    # Handle multiline generic maps with proper parenthesis matching
    component_pattern = r'\w+\s*:\s*(\w+)(?:\s+generic\s+map\s*\(.*?\))?\s+port\s+map'
    for match in re.finditer(component_pattern, content, re.IGNORECASE | re.DOTALL):
        component_name = match.group(1)
        # Skip generic component declarations in packages
        if not re.search(r'component\s+' + re.escape(component_name), content, re.IGNORECASE):
            dependencies.add(component_name)
    
    # Find library imports of specific entities: use work.package.entity
    # Pattern: use work.package_name.entity_name (but not .all)
    library_import_pattern = r'use\s+work\.(\w+)\.(\w+)'
    for match in re.finditer(library_import_pattern, content, re.IGNORECASE):
        package_name = match.group(1)
        entity_name = match.group(2)
        # Skip "all" imports as they don't create specific file dependencies
        if entity_name.lower() != 'all':
            # Add both the package and the entity as dependencies
            dependencies.add(package_name)  # Need the package file
            dependencies.add(entity_name)   # Need the entity file
        else:
            # For .all imports, only add the package dependency
            dependencies.add(package_name)
    
    return dependencies


def find_vhdl_files(patterns: List[str]) -> List[Path]:
    """
    Find all VHDL files matching the given glob patterns.
    """
    vhdl_files = []
    
    for pattern in patterns:
        # If pattern doesn't end with .vhd, add it
        if not pattern.endswith('.vhd') and not pattern.endswith('*.vhd'):
            if '*' in pattern or '?' in pattern:
                pattern += '*.vhd'
            else:
                pattern += '.vhd'
        
        # Expand glob pattern
        matches = glob.glob(pattern, recursive=True)
        for match in matches:
            path = Path(match)
            if path.is_file() and path.suffix == '.vhd':
                vhdl_files.append(path)
    
    return sorted(set(vhdl_files))


def find_entity_files(entity_name: str, search_dirs: List[str]) -> List[Path]:
    """
    Find VHDL files that define the given entity.
    """
    entity_files = []
    
    # Common search patterns
    search_patterns = [
        f"**/{entity_name}.vhd",
        f"*/{entity_name}.vhd", 
        f"{entity_name}.vhd"
    ]
    
    # Add search directories
    for search_dir in search_dirs:
        for pattern in search_patterns:
            full_pattern = f"{search_dir}/{pattern}"
            matches = glob.glob(full_pattern, recursive=True)
            for match in matches:
                path = Path(match)
                if path.is_file():
                    # Verify this file actually defines the entity
                    try:
                        with open(path, 'r') as f:
                            content = f.read()
                        entity_pattern = rf'entity\s+{re.escape(entity_name)}\s+is'
                        if re.search(entity_pattern, content, re.IGNORECASE):
                            entity_files.append(path)
                    except Exception:
                        pass
    
    return sorted(set(entity_files))


def build_dependency_graph(vhdl_files: List[Path], search_dirs: List[str]) -> Dict[Path, Set[Path]]:
    """
    Build a dependency graph where each file maps to the set of files it depends on.
    """
    # First, create a map from entity/component names to their defining files
    entity_to_files = {}
    
    # Find all possible VHDL files in search directories
    all_files = set(vhdl_files)
    for search_dir in search_dirs:
        pattern = f"{search_dir}/**/*.vhd"
        matches = glob.glob(pattern, recursive=True)
        for match in matches:
            path = Path(match)
            if path.is_file():
                all_files.add(path)
    
    # Map entity names to their defining files and find entity-architecture relationships
    entity_files = {}  # entity_name -> entity file path
    arch_to_entity = {}  # architecture file -> entity name
    
    for file_path in all_files:
        try:
            with open(file_path, 'r') as f:
                content = f.read()
            
            # Find entity declarations
            entity_pattern = r'entity\s+(\w+)\s+is'
            for match in re.finditer(entity_pattern, content, re.IGNORECASE):
                entity_name = match.group(1)
                if entity_name not in entity_to_files:
                    entity_to_files[entity_name] = set()
                entity_to_files[entity_name].add(file_path)
                entity_files[entity_name] = file_path
            
            # Find architecture declarations to link them to entities
            arch_pattern = r'architecture\s+\w+\s+of\s+(\w+)\s+is'
            for match in re.finditer(arch_pattern, content, re.IGNORECASE):
                entity_name = match.group(1)
                arch_to_entity[file_path] = entity_name
            
            # Find package declarations
            package_pattern = r'package\s+(\w+)\s+is'
            for match in re.finditer(package_pattern, content, re.IGNORECASE):
                package_name = match.group(1)
                if package_name not in entity_to_files:
                    entity_to_files[package_name] = set()
                entity_to_files[package_name].add(file_path)
        except Exception:
            continue
    
    # Build the dependency graph
    dependency_graph = {}
    all_dependent_files = set(vhdl_files)
    
    for vhdl_file in vhdl_files:
        dependencies = extract_vhdl_dependencies(vhdl_file)
        file_dependencies = set()
        
        # Only process dependencies for files that actually instantiate things
        # Entity-only files don't create dependencies
        if dependencies:  # Only if there are actual dependencies
            for dep in dependencies:
                if dep in entity_to_files:
                    for dep_file in entity_to_files[dep]:
                        if dep_file != vhdl_file:  # Don't depend on self
                            file_dependencies.add(dep_file)
                            all_dependent_files.add(dep_file)
        
        dependency_graph[vhdl_file] = file_dependencies
        
        # If this is an architecture file, also add dependency on its entity file
        if vhdl_file in arch_to_entity:
            entity_name = arch_to_entity[vhdl_file]
            if entity_name in entity_files:
                entity_file = entity_files[entity_name]
                if entity_file != vhdl_file:  # Don't add self-dependency
                    # Architecture depends on its entity file
                    file_dependencies.add(entity_file)
                    all_dependent_files.add(entity_file)
                    dependency_graph[vhdl_file] = file_dependencies
    
    # Add dependency files that aren't in the original list
    # We need to iterate until no new dependencies are found
    processed_files = set()
    while True:
        new_files = all_dependent_files - processed_files
        if not new_files:
            break
            
        for dep_file in new_files:
            processed_files.add(dep_file)
            if dep_file not in dependency_graph:
                dependencies = extract_vhdl_dependencies(dep_file)
                file_dependencies = set()
                
                for dep in dependencies:
                    if dep in entity_to_files:
                        for dep_dep_file in entity_to_files[dep]:
                            if dep_dep_file != dep_file:  # Don't depend on self
                                file_dependencies.add(dep_dep_file)
                                all_dependent_files.add(dep_dep_file)
                
                dependency_graph[dep_file] = file_dependencies
    
    return dependency_graph


def categorize_files(all_files: List[Path]) -> Dict[str, List[Path]]:
    """
    Categorize files into packages, entity-only, and architecture files.
    """
    packages = []
    entity_only = []
    architecture_files = []
    
    for file_path in all_files:
        try:
            with open(file_path, 'r') as f:
                content = f.read()
            
            # Check if file contains a package
            if re.search(r'package\s+\w+\s+is', content, re.IGNORECASE):
                packages.append(file_path)
            # Check if file contains an architecture
            elif re.search(r'architecture\s+\w+\s+of\s+\w+\s+is', content, re.IGNORECASE):
                architecture_files.append(file_path)
            # Check if file contains only entity (no architecture)
            elif re.search(r'entity\s+\w+\s+is', content, re.IGNORECASE):
                entity_only.append(file_path)
            else:
                # Default to architecture files for unknown types
                architecture_files.append(file_path)
        except Exception:
            # Default to architecture files if we can't read the file
            architecture_files.append(file_path)
    
    return {
        'packages': packages,
        'entity_only': entity_only, 
        'architecture_files': architecture_files
    }


def topological_sort(dependency_graph: Dict[Path, Set[Path]]) -> List[Path]:
    """
    Perform full topological sort, then reorder to maintain three-tier structure:
    1. Packages first
    2. Entity-only files  
    3. Architecture files
    While preserving dependency order within and across tiers.
    """
    # Get all files
    all_files = set(dependency_graph.keys())
    for deps in dependency_graph.values():
        all_files.update(deps)
    all_files = list(all_files)
    
    # Categorize files
    categories = categorize_files(all_files)
    package_set = set(categories['packages'])
    entity_set = set(categories['entity_only'])
    arch_set = set(categories['architecture_files'])
    
    # Perform full topological sort using Kahn's algorithm
    in_degree = defaultdict(int)
    for file_path in all_files:
        in_degree[file_path] = 0
    
    for file_path, deps in dependency_graph.items():
        for dep in deps:
            in_degree[file_path] += 1
    
    # Full topological sort
    queue = deque([f for f in all_files if in_degree[f] == 0])
    topo_order = []
    
    while queue:
        current = queue.popleft()
        topo_order.append(current)
        
        # Update in-degrees for files that depend on current
        for file_path, deps in dependency_graph.items():
            if current in deps:
                in_degree[file_path] -= 1
                if in_degree[file_path] == 0:
                    queue.append(file_path)
    
    # Check for cycles
    if len(topo_order) != len(all_files):
        print("Warning: Circular dependencies detected!", file=sys.stderr)
        remaining = [f for f in all_files if f not in topo_order]
        topo_order.extend(sorted(remaining))
    
    # Now reorder the topologically sorted list to respect the three-tier structure
    # while maintaining dependency order within each tier
    result = []
    
    # Extract files in topological order for each tier
    packages_ordered = [f for f in topo_order if f in package_set]
    entities_ordered = [f for f in topo_order if f in entity_set]  
    archs_ordered = [f for f in topo_order if f in arch_set]
    
    result.extend(packages_ordered)
    result.extend(entities_ordered)
    result.extend(archs_ordered)
    
    return result


def main():
    parser = argparse.ArgumentParser(
        description='Generate topologically sorted list of VHDL files based on dependencies'
    )
    parser.add_argument('-o', '--output', required=True,
                        help='Output file to write topologically sorted file list')
    parser.add_argument('patterns', nargs='+',
                        help='Glob patterns for VHDL files to analyze (e.g., abc.vhd a b/bt_*)')
    parser.add_argument('--search-dirs', nargs='*', 
                        default=['ttl', 'dip', 'cadr', 'cadr1', 'helper'],
                        help='Directories to search for entity definitions')
    
    args = parser.parse_args()
    
    # Find all VHDL files matching the patterns
    vhdl_files = find_vhdl_files(args.patterns)
    
    if not vhdl_files:
        print("No VHDL files found matching the given patterns", file=sys.stderr)
        return 1
    
    print(f"Analyzing {len(vhdl_files)} VHDL files...")
    
    # Build dependency graph
    dependency_graph = build_dependency_graph(vhdl_files, args.search_dirs)
    
    print(f"Built dependency graph with {len(dependency_graph)} files")
    
    # Perform topological sort
    sorted_files = topological_sort(dependency_graph)
    
    # Write output
    try:
        with open(args.output, 'w') as f:
            for file_path in sorted_files:
                f.write(f"{file_path}\n")
        
        print(f"Topologically sorted file list written to {args.output}")
        print(f"Total files in dependency order: {len(sorted_files)}")
        
    except Exception as e:
        print(f"Error writing to {args.output}: {e}", file=sys.stderr)
        return 1
    
    return 0


if __name__ == '__main__':
    sys.exit(main())
