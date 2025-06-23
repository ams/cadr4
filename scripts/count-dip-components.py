#!/usr/bin/env python3
import os
import re
from collections import Counter

# Get all dip component names and aliases from dip/dip.vhd
DIP_VHD = os.path.join(os.path.dirname(__file__), '../dip/dip.vhd')
DIP_PATTERN = re.compile(r'component\s+(dip_[a-zA-Z0-9_]+)\b')
ALIAS_PATTERN = re.compile(r'alias\s+(dip_[a-zA-Z0-9_]+)\s+is\s+(dip_[a-zA-Z0-9_]+)')

with open(DIP_VHD, 'r') as f:
    dip_vhd = f.read()

# Find all component names
components = set(DIP_PATTERN.findall(dip_vhd))
# Find all aliases and map them to their targets
aliases = dict(ALIAS_PATTERN.findall(dip_vhd))

# Map all aliases to their canonical component
def resolve_alias(name):
    while name in aliases:
        name = aliases[name]
    return name

all_dip_names = set(components) | set(aliases.keys())

# Prepare regex for matching DIP instantiations
DIP_INSTANCE_PATTERN = re.compile(r'\b(' + '|'.join(re.escape(name) for name in all_dip_names) + r')\b')

# Find all *_suds.vhd files in cadr/
cadr_dir = os.path.join(os.path.dirname(__file__), '../cadr')
suds_files = [os.path.join(cadr_dir, f) for f in os.listdir(cadr_dir) if f.endswith('_suds.vhd')]

# Count occurrences
counter = Counter()
for suds_file in suds_files:
    with open(suds_file, 'r') as f:
        for line in f:
            for match in DIP_INSTANCE_PATTERN.findall(line):
                canonical = resolve_alias(match)
                counter[canonical] += 1

# Print results, sorted by part name, right-aligned count
for name in sorted(counter):
    print(f"{counter[name]:4d} {name}") 