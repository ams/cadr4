#!/usr/bin/env python3

import argparse
import os
import pickle
import re
import sys
from typing import List, Dict, Tuple, Any

# signals are stored in signal_repo so the signal instance is shared among everywhere
signal_repo = {}
bus_list = []

VERBOSE = False

def verbose(*args, **kwargs):
    if VERBOSE:
        print(*args, **kwargs)


# load sets list file
def parse_sets(filename: str) -> dict:
    sets_dict = {}   
    with open(filename, 'r') as file:
        for line in file:
            line = line.strip()
            if line and line[0] != '#':  # Skip empty lines and comments
                words = [word.strip() for word in line.split()]
                if len(words) > 1:
                    set_name = words[0]
                    set_components = words[1:]
                    sets_dict[set_name] = set_components
    
    return sets_dict


# loads busses list file
def load_bus_list(filename: str) -> list:    
    assert len(bus_list) == 0, "bus_list already loaded"
    with open(filename, 'r') as file:
        for line in file:
            bus_name = line.strip()
            if bus_name and bus_name[0] != '#':  # Skip empty lines and comments
                # take the first word as bus name
                bus_name = line.split()[0]
                # Create regex pattern: bus_name followed by one or two digits
                # If first digit is 0, there cannot be a second digit
                # Pattern: bus_name + (0 | [1-9][0-9]?)
                pattern = f"{re.escape(bus_name.lower())}(0|[1-9][0-9]?)$"
                compiled_regex = re.compile(pattern)
                bus_list.append((bus_name, compiled_regex))


def vhdl_to_components(filename: str) -> dict:
    components = {}

    # Read the file
    with open(filename, 'r') as f:
        content = f.read()
    
    # Remove comments (-- to end of line)
    content = re.sub(r'--.*', '', content)
    
    # Find the first package
    package_match = re.search(r'package\s+\w+\s+is\s*(.*?)\s*end\s+package', content, re.DOTALL | re.IGNORECASE)
    if not package_match:
        return vcomponents
    
    package_content = package_match.group(1)
    
    # Pattern to match component declarations
    component_pattern = r'component\s+(\w+)\s+is\s*(.*?)\s*end\s+component'

    for comp_match in re.finditer(component_pattern, package_content, re.DOTALL | re.IGNORECASE):
        component_name = comp_match.group(1)
        component_body = comp_match.group(2)

        if component_name in components:
            print(f"Component {component_name} already defined in VHDL file", file=sys.stderr)
            sys.exit(1)

        component = vComponent(component_name)
        components[component_name] = component
        
        # Skip generic if present
        generic_pattern = r'generic\s*\([^)]*\)\s*;'
        component_body = re.sub(generic_pattern, '', component_body, flags=re.IGNORECASE)
        
        # Find port declaration
        port_match = re.search(r'port\s*\(\s*(.*?)\s*\)\s*;', component_body, re.DOTALL | re.IGNORECASE)
        if not port_match:
            continue
            
        port_content = port_match.group(1)
        
        # Split port declarations by semicolon
        port_declarations = [p.strip() for p in port_content.split(';') if p.strip()]
        
        for port_decl in port_declarations:
            port_decl = port_decl.strip()
            if not port_decl:
                continue
                
            # Parse port declaration: name : direction type
            # Handle extended identifiers with backslashes
            port_pattern = r'(\\[^\\]+\\|\w+)\s*:\s*(in|out)\s+(\w+)'
            port_match = re.match(port_pattern, port_decl, re.IGNORECASE)
            
            if port_match:
                port_name = port_match.group(1)
                port_mode = port_match.group(2).lower()
                port_type = port_match.group(3)
                
                assert port_mode == "in" or port_mode == "out"
                assert port_type == "std_logic"

                component.add_port(vPortScalar(port_name, port_mode))
        
    return components
    

def signal_name_key(name:str) -> str:
    if len(name) >= 2 and name[0] == '\\' and name[1] == '-': 
            name = name[2:]

    elif len(name) >= 1 and (name[0] == '-' or name[0] == '\\'): 
        name = name[1:]

    for i in range(0, len(name)):
        if name[i].isdigit():
            npad = 4 - len(name[i:])
            name = name[:i] + "0" * npad + name[i:]
            break;

    return name

# port order key function
# ignores \, - and \- in port names
def signals_key_fn(signal:'vSignal') -> str:
    return signal_name_key(signal.name)


def ports_key_fn(port:'vPort') -> str:
    return port.mode + "_" + signal_name_key(port.name)


class vSignal:
    def __init__(self, name:str, **kwargs):        
        self.name:str = name
        self.ref_ports = []
        super().__init__(**kwargs)

    def add_ref_port(self, port:'vPort') -> None:
        self.ref_ports.append(port)

    def dump_signal_declaration(self, f) -> None:
        print(f"  signal {self.name}: {self.get_type()};", file=f)


class vSignalScalar(vSignal):
    def __init__(self, name:str, **kwargs):        
        self.bus_name, self.bus_index = self._bus_name_and_index(name)
        super().__init__(name, **kwargs)

    def _bus_name_and_index(self, name) -> None:
        for bus_name, regex in bus_list:
            match = regex.match(name)
            if match:
                bus_index = int(match.group(1))
                return bus_name, bus_index
        
        return None, -1

    def get_type(self) -> str:
        return "std_logic"

    def get_port_map_rhs(self) -> str:
        if self.bus_name:
            return f"{self.bus_name}({self.bus_index})"

        else:
            return self.name


class vSignalArray(vSignal):
    def __init__(self, name:str, bit_start:int, bit_end:int, **kwargs):
        assert (bit_start <= bit_end)
        self.bit_start = bit_start
        self.bit_end = bit_end
        super().__init__(name, **kwargs)

    def get_type(self) -> str:
        return f"std_logic_vector({self.bit_end} downto {self.bit_start})"

    def get_port_map_rhs(self) -> str:
        return f"{self.name}({self.bit_end} downto {self.bit_start})"


class vPort:
    def __init__(self, mode:str, **kwargs):
        self.mode = mode  
        # if status is external, this port will also be an external port on set
        # if status is internal, this port will not be an external port on set but will be an internal signal
        # if status is unused, this port is not used, so it will be terminated only (0 or open) in port map
        self.status = "external"
        self.component = None        
        self.bus_port = None
        super().__init__(**kwargs)

    def set_component(self, component:'vComponent') -> None:
        self.component = component    

    def set_bus_port(self, bus_port:'vPortArray') -> None:
        self.bus_port = bus_port

    def dump_port_declaration(self, f, do_not_add_semicolon:bool=False) -> None:        
        semicolon = "" if do_not_add_semicolon else ";"
        print(f"      {self.name}: {self.mode} {self.get_type()}{semicolon}", file=f)

    def dump_port_map(self, f, do_not_add_comma:bool=False) -> None:
        comma = "" if do_not_add_comma else ","
        if self.status == "unused":
            if self.mode == "in":
                print(f"    {self.name} => '0'{comma}", file=f)

            else:
                print(f"    {self.name} => open{comma}", file=f)

        else:            
            print(f"    {self.name} => {self.get_port_map_rhs()}{comma}", file=f)        
        

class vPortScalar(vPort, vSignalScalar):
    def __init__(self, name:str, mode:str, **kwargs):
        super().__init__(name=name, mode=mode, **kwargs)  


class vPortArray(vPort, vSignalArray):
    def __init__(self, name:str, bit_start:int, bit_end:int, mode:str, **kwargs):
        super().__init__(name=name, bit_start=bit_start, bit_end=bit_end, mode=mode, **kwargs)
        

class vComponent:
    def __init__(self, name:str):
        self.name = name
        self.ports = {}
        self.internal_signals = {}

    def in_ports(self) -> list:        
        return sorted([port for port in self.ports.values() if port.mode == "in"], key=ports_key_fn)

    def out_ports(self) -> list:
        return sorted([port for port in self.ports.values() if port.mode == "out" or port.mode == "inout"], key=ports_key_fn)    

    def add_port(self, port:vPort) -> None:
        port.set_component(self)
        # the port names should be unique independent of the direction
        if port.name in self.ports:
            existing_port = self.ports[port.name]
            new_port = port
            if existing_port.mode == new_port.mode:
                # not really an error, we already have the port
                pass

            elif existing_port.mode == "inout":
                # not really an error, we have an inout port so it can function both as in and out
                # the new_port will not be added but the function is there
                pass

            elif new_port.mode == "inout":
                # this is not really an error, we already had a port so just switch the mode
                verbose(f"vComponent.add_port: {existing_port.component.name}.{existing_port.name} already exists but not inout, switching to inout")
                existing_port.mode = "inout"

            elif ((existing_port.mode == "in" and new_port.mode == "out") or 
                  (existing_port.mode == "out" and new_port.mode == "in")):
                # a new mode port is being added with same name reverse direction, port mode can be changed
                verbose(f"vComponent.add_port: {existing_port.component.name}.{existing_port.name} already added with different direction, changing mode to inout")
                existing_port.mode = "inout"

            else:
                print(f"existing_port: {existing_port.component.name}.{existing_port.name} {existing_port.mode}", file=sys.stderr)
                print(f"new_port: {new_port.component.name}.{new_port.name} {new_port.mode}", file=sys.stderr)
                str = f"vComponent.add_port: {port.name} already added with different direction"
                assert False, str

        else:
            self.ports[port.name] = port

    def add_internal_signal(self, signal:vSignal) -> None:
        if signal.name not in self.internal_signals:
            self.internal_signals[signal.name] = signal

    def dump_port_interface_list(self, f) -> None:
        print(f"    port (", file=f)
        for port in self.in_ports():
            port.dump_port_declaration(f)

        out_ports = self.out_ports()
        for i, port in enumerate(out_ports):
            port.dump_port_declaration(f, do_not_add_semicolon=(i == (len(out_ports) - 1)))

        print(f"    );", file=f)

    def dump_component_declaration(self, f) -> None:
        print(f"  component {self.name} is", file=f)        
        for i, internal_signal in enumerate(sorted(self.internal_signals.values(), key=signals_key_fn)):
            if i % 5 == 0:
                if i > 0:
                    print("", file=f)

                print(f"      -- internal signals: ", file=f, end="")

            print(f"{internal_signal.name} ", file=f, end="")            

        print("", file=f)
        self.dump_port_interface_list(f)
        print(f"  end component;", file=f)

    def dump_component_instantiation(self, f) -> None:
        print(f"  {self.name}_inst: {self.name} port map (", file=f)
        for in_port in self.in_ports():
            in_port.dump_port_map(f)

        out_ports = self.out_ports()                
        for i, out_port in enumerate(out_ports):
            out_port.dump_port_map(f, do_not_add_comma=(i == (len(out_ports) - 1)))

        print(f"  );", file=f)

    def dump_entity(self, f) -> None:
        print("library ieee;", file=f)
        print("use ieee.std_logic_1164.all;", file=f)
        print("", file=f)
        print("use work.cadr_book.all;", file=f)
        print("use work.icmem_book.all;", file=f)
        print("", file=f)

        print(f"entity {self.name} is", file=f)
        self.dump_port_interface_list(f)
        print("end entity;", file=f);
        print("", file=f)

        print(f"architecture structural of {self.name} is", file=f)
        for internal_signal in sorted(self.internal_signals.values(), key=signals_key_fn):
            internal_signal.dump_signal_declaration(f);

        print("begin", file=f);
        for component in sorted(self.components.values(), key=lambda x: x.name):
            component.dump_component_instantiation(f)

        print("end architecture;", file=f);    

    def is_signal_used_as_input(self, signal:vSignal) -> set:
        for port in self.in_ports():
            if port.name == signal.name:
                return True

        return False

    def is_signal_used_as_output(self, signal:vSignal) -> set:
        for port in self.out_ports():
            if port.name == signal.name:
                return True

        return False


class vSetComponent(vComponent):
    def __init__(self, name:str):
        super().__init__(name)
        self.components = {}

    def add_component(self, component:vComponent) -> None:
        assert component.name not in self.components, "vSetComponent.add_component: component already added"
        self.components[component.name] = component

    def is_signal_used_as_input(self, signal:vSignal) -> set:
        for component in self.components.values():
            if component.is_signal_used_as_input(signal):
                return True

        return False

    def is_signal_used_as_output(self, signal:vSignal) -> set:
        for component in self.components.values():
            if component.is_signal_used_as_output(signal):
                return True

        return False

    def bundle_bus_ports(self) -> None:        
        bus_minmax = {}
        for port in self.ports.values():
            if port.bus_index >= 0:
                bus_name = port.bus_name
                bus_index = port.bus_index
                bus_key = (bus_name, port.mode)
                if bus_key not in bus_minmax:
                    bus_minmax[bus_key] = [100, -1]

                bus_minmax[bus_key][0] = min(bus_minmax[bus_key][0], bus_index)
                bus_minmax[bus_key][1] = max(bus_minmax[bus_key][1], bus_index)

        bus_ports = []
        remove_port_names = set()
        for bus_key in bus_minmax.keys():
            bus_name, mode = bus_key
            bus_min = bus_minmax[bus_key][0]
            bus_max = bus_minmax[bus_key][1]
            if bus_max > bus_min:
                bus_port = vPortArray(bus_name, bus_min, bus_max, mode)
                bus_ports.append(bus_port)
                for port in self.ports.values():
                    if port.bus_name == bus_name:
                        remove_port_names.add(port.name)

        # remove ports corresponding to new bus ports
        for port_name in remove_port_names:
            del self.ports[port_name]

        # add new bus ports
        for bus_port in bus_ports:
            self.add_port(bus_port)
    
class vPackage:
    def __init__(self, name:str):
        self.name = name
        self.set_components = {}

    def add_set_component(self, set_component:vSetComponent):
        assert isinstance(set_component, vSetComponent), "vPackage.add_component: vComponent is not a vSetComponent"
        self.set_components[set_component.name] = set_component

    def get_set_components_list(self) -> list:
        return sorted(self.set_components.values(), key=lambda x: x.name)

    def dump_package(self, f) -> None:
        print("library ieee;", file=f)
        print("use ieee.std_logic_1164.all;", file=f)
        print("", file=f)
        print(f"package {self.name} is", file=f)
        for set_component in sorted(self.set_components.values(), key=lambda x: x.name):
            set_component.dump_component_declaration(f)

        print("end package;", file=f);

    def dump_tb(self, f) -> None:
        print("library ieee;", file=f)
        print("use ieee.std_logic_1164.all;", file=f)
        print("", file=f)
        print("use work.set.all;", file=f);
        print("", file=f)

        print(f"entity {self.name}_tb is", file=f)
        print("end entity;", file=f)
        print("", file=f)

        print(f"architecture structural of {self.name}_tb is", file=f)
        busses = {}
        decls = set()
        for set_component in self.set_components.values():
            for port in set_component.ports.values():
                if isinstance(port, vPortArray):
                    (bus_min, bus_max) = busses.get((port.name, port.mode), (100, -1))
                    bus_min = min(bus_min, port.bit_start)
                    bus_max = max(bus_max, port.bit_end)
                    busses[(port.name, port.mode)] = (bus_min, bus_max)

                elif isinstance(port, vPortScalar):
                    decl = f"  signal {port.name}: {port.get_type()};"
                    decls.add(decl)

                else:
                    assert False, f"vPackage.dump_tb: unknown port type: {type(port)}"
                    
        for key, (bus_min, bus_max) in busses.items():
            print(f"  signal {key}: std_logic_vector({bus_max} downto {bus_min});", file=f)

        for decl in sorted(decls):
            print(decl, file=f)

        print("begin", file=f);
        for set_component in sorted(self.set_components.values(), key=lambda x: x.name):
            print(f"  {set_component.name}_inst: {set_component.name} port map (", file=f)

            for in_port in set_component.in_ports():
                in_port.dump_port_map(f)

            out_ports = set_component.out_ports()
            for i, out_port in enumerate(out_ports):
                out_port.dump_port_map(f, do_not_add_comma=(i == (len(out_ports) - 1)))

            print(f"  );", file=f)

        print("end architecture;", file=f);

    def is_signal_used_as_input(self, signal:vSignal, exclude_set_component:vComponent=None) -> set:
        for set_component in self.set_components.values():
            if exclude_set_component is None or set_component != exclude_set_component:
                if set_component.is_signal_used_as_input(signal):
                    return True

        return False

    def is_signal_used_as_output(self, signal:vSignal, exclude_set_component:vComponent=None) -> set:
        for set_component in self.set_components.values():
            if exclude_set_component is None or set_component != exclude_set_component:
                if set_component.is_signal_used_as_output(signal):
                    return True
                    
        return False

    def find_input_usages(self, signal:vSignal) ->  list:
        usages = []
        for set_component in self.set_components.values():
            used = False
            for sub_component in set_component.components.values():
                for in_port in sub_component.in_ports():
                    if in_port.name == signal.name:
                        used = True
                        break

                if used:
                    usages.append(sub_component.name)
                    break

        return usages

    def find_output_usages(self, signal:vSignal) ->  list:
        usages = []
        for set_component in self.set_components.values():
            used = False
            for sub_component in set_component.components.values():
                for out_port in sub_component.out_ports():
                    if out_port.name == signal.name:
                        used = True
                        break

                if used:
                    usages.append(sub_component.name)
                    break

        return usages

    def merge_entities(self) -> None:
        for set_component in self.set_components.values():
            verbose(f"set_component: {set_component.name}")
            for sub_component in set_component.components.values():
                verbose(f"  sub_component: {sub_component.name}")
                for out_port in sub_component.out_ports():
                    verbose(f"    out_port: {out_port.name}")
                    
                    is_input_to_aliens = self.is_signal_used_as_input(out_port, set_component)
                    is_input_to_siblings = set_component.is_signal_used_as_input(out_port)

                    # input to aliens ? then out port needed
                    # this also covers the case it is both input to aliens and siblings
                    if is_input_to_aliens:
                        verbose(f"    adding out_port: {out_port.name} - input to aliens: {self.find_input_usages(out_port)}")
                        out_port.status = "external"
                        new_port = vPortScalar(out_port.name, "out")
                        new_port.add_ref_port(out_port)
                        set_component.add_port(new_port)
                    
                    # input to siblings only ? then use it as internal signal
                    elif is_input_to_siblings:
                        verbose(f"    marking out_port: {out_port.name} as internal - input to siblings only: {self.find_input_usages(out_port)}")
                        out_port.status = "internal"
                        new_signal = vSignalScalar(out_port.name)
                        new_signal.add_ref_port(out_port)
                        set_component.add_internal_signal(new_signal)
                        
                    # nobody receives it, mark unused, this will be terminated by open in port map
                    else:
                        verbose(f"    marking out_port: {out_port.name} as unused - nobody uses it")
                        out_port.status = "unused"
                    
                for in_port in sub_component.in_ports():
                    verbose(f"    in_port: {in_port.name}")

                    is_output_from_aliens = self.is_signal_used_as_output(in_port, set_component)
                    is_output_from_siblings = set_component.is_signal_used_as_output(in_port)

                    # output from aliens ? then in port needed
                    if is_output_from_aliens:
                        # this is important
                        # if it is also driven by siblings, "in" is not enough
                        # because an "in" port signal cannot be driven
                        # so it has to be "inout" in that case
                        mode = "inout" if is_output_from_siblings else "in"
                        verbose(f"    adding f{mode}_port: {in_port.name} - output from aliens: {self.find_output_usages(in_port)}")
                        in_port.status = "external"
                        new_port = vPortScalar(in_port.name, mode)
                        new_port.add_ref_port(in_port)
                        set_component.add_port(new_port)
                    
                    # output from siblings only ? then use it as internal signal
                    elif is_output_from_siblings:
                        verbose(f"    marking in_port: {in_port.name} as internal - output from siblings only: {self.find_output_usages(in_port)}")
                        in_port.status = "internal"
                        # no internal signal is added here
                        # because if it is needed, it will be added by the output port
                        # or an external out port will be added and it will be used

                    # nobody outputs this, mark unused, this should not happen ?
                    else:
                        verbose(f"    marking in_port: {in_port.name} as unused - nobody uses it")
                        in_port.status = "unused"

            # the process above might leave the set_component with a port and an internal signal
            # remove internal signals if there is a port
            for port in set_component.ports.values():
                if port.name in set_component.internal_signals:
                    del set_component.internal_signals[port.name]

        if len(bus_list) > 0:
            for set_component in self.set_components.values():
                set_component.bundle_bus_ports()


def main():
    parser = argparse.ArgumentParser(
        description="Create VHDL set entities from component definitions")
    
    parser.add_argument(
        "-c", "--create-cache-file",
        help="create cache file")

    parser.add_argument(
        "-u", "--use-cache-file",
        help="create cache file")    
    
    parser.add_argument(
        "-s", "--sets_list_file",
        help="File containing set definitions")
    
    parser.add_argument(
        "-b", "--bus_list_file",
        help="File containing bus signal definitions")
    
    parser.add_argument(
        "--vhdl-files",
        nargs="+",
        help="One or more VHDL package files containing component definitions")

    parser.add_argument(
        "-v", "--verbose",
        action="store_true",
        help="Verbose")

    parser.add_argument(
        "-o", "--output-dir",
        help="Output dir")

    parser.add_argument(
        "-e", "--entity_name",
        help="Set entity name to generate")

    parser.add_argument(
        "-p", "--package-name",
        default="set",
        help="Package name")
    
    args = parser.parse_args()

    # if not specified, output dir is the same as the package name
    if args.output_dir is None:
        args.output_dir = args.package_name

    global VERBOSE
    VERBOSE = True if args.verbose else False

    components = {}
    vpackage = None

    if args.use_cache_file:
        with open(args.use_cache_file, "rb") as f:
            vpackage = pickle.load(f)

    else:
    
        # load bus list first
        if args.bus_list_file is not None:
            load_bus_list(args.bus_list_file)

        # create components from VHDL packages
        # {"component_name": {"in": [("port_name", "direction", "type")], "out": [("port_name", "direction", "type")]}}
        components = {}
        for vhdl_file in args.vhdl_files:
            components.update(vhdl_to_components(vhdl_file))

        # create package from the set list and check if we have all component definitions
        vpackage = vPackage(args.package_name)
        for set_name, component_names in parse_sets(args.sets_list_file).items():
            set_component = vSetComponent(set_name)
            for component_name in component_names:
                if component_name not in components:
                    print(f"Component {component_name} not found in VHDL files", file=sys.stderr)
                    sys.exit(1)

                set_component.add_component(components[component_name])

            vpackage.add_set_component(set_component)

        # this is where magic happens
        vpackage.merge_entities()

    if args.create_cache_file:
        with open(args.create_cache_file, "wb") as f:
            pickle.dump(vpackage, f)

    else:
        if args.output_dir is None:
            print(f"vPackage.dump_package: output dir not specified", file=sys.stderr)
            exit(1)

        if args.entity_name is None:
            print(f"vPackage.dump_package: entity name not specified", file=sys.stderr)
            exit(1)

        if args.entity_name == args.package_name:
            fpath = os.path.join(args.output_dir, f"{args.entity_name}.vhd")
            with open(fpath, "w") as f:
                vpackage.dump_package(f)
            
        elif args.entity_name == args.package_name + "_tb":
            fpath = os.path.join(args.output_dir, f"{args.entity_name}.vhd")
            with open(fpath, "w") as f:
                vpackage.dump_tb(f)

        else:
            if args.entity_name not in vpackage.set_components:
                print(f"vPackage.dump_entity: entity {args.entity_name} not found", file=sys.stderr)
                exit(1)

            fpath = os.path.join(args.output_dir, f"{args.entity_name}.vhd")
            with open(fpath, "w") as f:
                vpackage.set_components[args.entity_name].dump_entity(f)


if __name__ == "__main__":
    main()