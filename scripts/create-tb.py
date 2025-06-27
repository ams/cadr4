#!/usr/bin/env python3
#

import argparse
import os
import pickle
import re
import sys
from typing import List, Dict, Tuple, Any

VERBOSE = False

def verbose(*args, **kwargs):
    if VERBOSE:
        print(*args, **kwargs)


# key function for ordering signal names
# removes \ and - from the name
# pads the name with 0s to make it 4 digits long
# returns: str
def signal_name_key(name:str) -> str:
    assert name is not None and len(name) > 0
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

def signals_key_fn(signal:'vSignal') -> str:
    return signal_name_key(signal.name)


# for ordering ports, prepend the port mode to the signal name also
def ports_key_fn(port:'vPort') -> str:
    return port.mode + "_" + signal_name_key(port.name)

VHDL_IDENTIFIER_PATTERN = re.compile(r'^[a-zA-Z_][a-zA-Z0-9_]*$')

# the base class representing a signal in VHDL
# this is not directly used, its subclasses, vSignalScalar and vSignalArray, are used
class vSignal:
    def __init__(self, name:str, **kwargs):                
        super().__init__(**kwargs)
        assert name is not None and len(name) > 0
        # is provided name already escaped ? then derive the unescaped name
        if name[0] == '\\':
            assert name[-1] == '\\', f"vSignal.__init__: name {name} starts with / but does not end with /"
            self.name:str = name[1:-1]
            self.escaped_name:str = f"\\{self.name}\\"

        # is provided name not a valid identifier ? then escape it
        elif VHDL_IDENTIFIER_PATTERN.match(name) is None:
                self.name:str = name
                self.escaped_name:str = f"\\{name}\\"

        # not escaped and it is a valid identifier, no need for escaping
        else:
            self.name:str = name
            self.escaped_name = self.name

        self.set_default_value = False

    def __str__(self) -> str:
        return f"signal {self.name}: {self.get_type()}"

    def dump_signal_declaration(self, f) -> None:
        if self.set_default_value:
            print(f"  signal {self.escaped_name}: {self.get_type()} := {self.get_default_value()};", file=f)
        else:
            print(f"  signal {self.escaped_name}: {self.get_type()};", file=f)


# std_logic scalar signal in VHDL
class vSignalScalar(vSignal):
    def __init__(self, name:str, **kwargs):                
        super().__init__(name, **kwargs)

    def get_type(self) -> str:
        return "std_logic"

    def get_default_value(self) -> str:
        if self.name[0] == '-':
            return "'1'"
        else:
            return "'0'"

# std_logic_vector array signal in VHDL
class vSignalArray(vSignal):
    def __init__(self, name:str, bus_name:str, low:int, high:int, **kwargs):
        super().__init__(name, **kwargs)
        assert bus_name is not None and len(bus_name) > 0
        self.bus_name = bus_name
        assert high >= low
        self.low = low
        self.high = high

    def get_type(self) -> str:
        return f"std_logic_vector({self.high} downto {self.low})"

    def get_default_value(self) -> str:
        if self.name[0] == '-':
            return "(others => '1')"
        else:
            return "(others => '0')"


# the base class representing a port in VHDL
# this is not directly used, and the subclasses are also derived from a subclass of vSignal
class vPort:
    def __init__(self, mode:str, **kwargs):
        super().__init__(**kwargs)
        assert mode == 'in' or mode == 'out' or mode == 'inout'
        self.mode = mode

    def __str__(self) -> str:
        return f"{self.name}: {self.mode} {self.get_type()}"

    def dump_port_declaration(self, f, do_not_add_semicolon:bool) -> None:        
        semicolon = "" if do_not_add_semicolon else ";"
        print(f"      {self.escaped_name}: {self.mode} {self.get_type()}{semicolon}", file=f)


# std_logic scalar port in VHDL
# scalar port is also a scalar signal
# it is basically a signal with a mode
class vPortScalar(vPort, vSignalScalar):
    def __init__(self, name:str, mode:str, **kwargs):
        super().__init__(name=name, mode=mode, **kwargs)

    def dump_association_element(self, f, associated_signal_element:Tuple[vSignal, int, int], do_not_add_comma:bool) -> None:
        comma = "" if do_not_add_comma else ","
        if associated_signal_element is None:
            if self.mode == "in":
                print(f"    {self.escaped_name} => '0'{comma}", file=f)

            else:
                print(f"    {self.escaped_name} => open{comma}", file=f)

        else:
            associated_signal, idx, _ = associated_signal_element
            if isinstance(associated_signal, vSignalScalar):
                print(f"    {self.escaped_name} => {associated_signal.escaped_name}{comma}", file=f)

            elif isinstance(associated_signal, vSignalArray):
                print(f"    {self.escaped_name} => {associated_signal.escaped_name}({idx}){comma}", file=f)

            else:
                assert False, "vPortScalar.dump_association_element: associated_signal is not a vSignalScalar or vSignalArray"


# std_logic_vector array port in VHDL
# array port is also an array signal
# it is basically a signal with a mode
class vPortArray(vPort, vSignalArray):
    def __init__(self, name:str, bus_name:str, low:int, high:int, mode:str, **kwargs):
        super().__init__(name=name, bus_name=bus_name, low=low, high=high, mode=mode, **kwargs)

    def dump_association_element(self, f, associated_signal_element:Tuple[vSignal, int, int], do_not_add_comma:bool) -> None:        
        comma = "" if do_not_add_comma else ","
        if associated_signal_element is None:
            if self.mode == "in":
                print(f"    {self.escaped_name} => (others => '0'){comma}", file=f)

            else:
                # (others => open) is not allowed
                print(f"    {self.escaped_name} => open{comma}", file=f)

        else:
            associated_signal, low, high = associated_signal_element
            if isinstance(associated_signal, vSignalScalar):
                assert False, "vPortArray.dump_association_element: associated_signal is a vSignalScalar"

            elif isinstance(associated_signal, vSignalArray):
                print(f"    {self.escaped_name} => {associated_signal.escaped_name}({high} downto {low}){comma}", file=f)

            else:
                assert False, "vPortArray.dump_association_element: associated_signal is not a vSignalScalar or vSignalArray"


class vInterface:
    def __init__(self):
        self.ports:Dict[str, vPort] = {}

    # this function is only used for graph traversal
    def in_ports(self) -> List[vPort]:
        return sorted([port for port in self.ports.values() if port.mode == "in" or port.mode == "inout"], key=ports_key_fn)    

    # this function is only used for graph traversal
    def out_ports(self) -> List[vPort]:
        return sorted([port for port in self.ports.values() if port.mode == "out" or port.mode == "inout"], key=ports_key_fn)    

    # this function is used when dumping
    def ordered_ports(self) -> List[vPort]:
        ordered_ports = []
        ordered_ports.extend(sorted([port for port in self.ports.values() if port.mode == "in"], key=ports_key_fn))
        ordered_ports.extend(sorted([port for port in self.ports.values() if port.mode == "inout"], key=ports_key_fn))
        ordered_ports.extend(sorted([port for port in self.ports.values() if port.mode == "out"], key=ports_key_fn))
        return ordered_ports

    def add_port(self, port:vPort) -> None:
        assert port is not None
        self.ports[port.name] = port

    def remove_port_by_name(self, name:str) -> None:
        assert name is not None and len(name) > 0
        del self.ports[name]

    # port clause includes port ( ... );, everything here including port keyword, parentheses and semicolon
    def dump_port_clause(self, f) -> None:
        # empty port interface list is not allowed
        ports = self.ordered_ports()
        if len(ports) > 0:
            print(f"    port (", file=f)
            for i, port in enumerate(ports):
                do_not_add_semicolon = (i == (len(ports) - 1))
                port.dump_port_declaration(f, do_not_add_semicolon=do_not_add_semicolon)

            print(f"    );", file=f)


# component in VHDL
# the difference from entity is we do not know (or care) the implementation of component
# we just assume it is there, so this is just a component name and its interface
class vComponent(vInterface):
    def __init__(self, name:str, package_name:str):
        super().__init__()
        assert name is not None and len(name) > 0
        self.name = name
        self.package_name = package_name
        self.association_list_elements:Dict[vPort, Tuple[vSignal, int, int]] = {}

    def __str__(self) -> str:
        return f"component {self.package_name}.{self.name}"

    # does not support vPortArray assignment by concataneation of multiple vSignal's
    def add_association_list_element(self, port:vPort, signal:vSignal, low:int=None, high:int=None) -> None:
        assert port is not None
        assert signal is not None        
        if isinstance(port, vPortScalar):
            # vPortScalar -> (vSignalScalar, _, _)
            if isinstance(signal, vSignalScalar):
                assert low is None and high is None, f"vComponent.add_association_list_element: low and high must be None for vSignalScalar"

            # vPortScalar -> (vSignalArray, idx, idx)
            elif isinstance(signal, vSignalArray):
                assert low is not None and low >= 0, f"vComponent.add_association_list_element: low must be not None and >= 0 for vPortScalar"
                high = low if high is None else high

            else:
                assert False, "vComponent.add_association_list_element: signal is not a vSignalScalar or vSignalArray"

        # vPortArray -> (vSignalArray, low, high)
        elif isinstance(port, vPortArray):

            assert isinstance(signal, vSignalArray), f"vComponent.add_association_list_element: signal is not a vSignalArray for vPortArray"
            assert low is not None and low >= 0, f"vComponent.add_association_list_element: low must be not None and >= 0 for vPortArray"
            assert high is not None and high >= low, f"vComponent.add_association_list_element: high must be not None and >= low for vPortArray"

        else:
            assert False, "vComponent.add_association_list_element: signal is not a vSignalScalar or vSignalArray"

        self.association_list_elements[port] = (signal, low, high)

    def dump_component_declaration(self, f) -> None:
        print(f"  component {self.name} is", file=f)
        self.dump_port_clause(f)
        print(f"  end component;", file=f)

    def dump_component_instantiation(self, f) -> None:
        print(f"  {self.name}_inst: {self.name} port map (", file=f)
        ports = self.ordered_ports()
        last_mode = ""
        for i, port in enumerate(ports):
            if port.mode != last_mode:
                print(f"      -- {port.mode} ports", file=f)
                last_mode = port.mode

            port.dump_association_element(
                f, 
                self.association_list_elements.get(port, None), 
                do_not_add_comma=(i == (len(ports) - 1)))

        print(f"  );", file=f)

    def is_signal_used_as_input(self, signal:vSignal) -> bool:
        assert signal is not None
        for port in self.in_ports():
            if port.name == signal.name:
                return True

        return False

    def is_signal_used_as_output(self, signal:vSignal) -> bool:
        assert signal is not None
        for port in self.out_ports():
            if port.name == signal.name:
                return True

        return False

    def find_input_usages(self, signal:vSignal) -> set:
        assert signal is not None
        usages = set()
        for port in self.in_ports():
            if port.name == signal.name:
                usages.add(self)

        return usages

    def find_output_usages(self, signal:vSignal) -> list:
        assert signal is not None
        usages = set()
        for port in self.out_ports():
            if port.name == signal.name:
                usages.add(self)

        return usages


# entity in VHDL
# difference from component is that entity has an implementation in addition to an interface
# thus it has internal_signals and instantiated components
class vEntity(vInterface):
    def __init__(self, name:str, package_name:str):
        super().__init__()
        assert name is not None and len(name) > 0
        self.name = name
        self.package_name = package_name
        self.ports:Dict[str, vPort] = {}
        self.internal_signals = {}
        self.components = {}

    def __str__(self) -> str:
        return f"entity {self.package_name}.{self.name}"

    def as_component(self) -> vComponent:
        component = vComponent(self.name, self.package_name)
        for port in self.ports.values():
            component.add_port(port)

        return component

    def is_signal_used_as_input(self, signal:vSignal) -> bool:
        assert signal is not None
        for port in self.in_ports():
            if port.name == signal.name:
                return True

        for component in self.components.values():
            if component.is_signal_used_as_input(signal):
                return True

        return False

    def is_signal_used_as_output(self, signal:vSignal) -> bool:
        assert signal is not None
        for port in self.out_ports():
            if port.name == signal.name:
                return True

        for component in self.components.values():
            if component.is_signal_used_as_output(signal):
                return True

        return False

    def find_input_usages(self, signal:vSignal) -> set:
        assert signal is not None
        usages = set()
        for port in self.in_ports():
            if port.name == signal.name:
                usages.add(self)

        for component in self.components.values():
            usages.update(component.find_input_usages(signal))

        return usages

    def find_output_usages(self, signal:vSignal) -> list:
        assert signal is not None
        usages = set()
        for port in self.out_ports():
            if port.name == signal.name:
                usages.add(self)

        for component in self.components.values():
            usages.update(component.find_output_usages(signal))

        return usages

    def add_port(self, port:vPort) -> None:
        assert port is not None
        self.ports[port.name] = port

    def add_internal_signal(self, signal:vSignal) -> None:
        assert signal is not None
        self.internal_signals[signal.name] = signal

    def add_component(self, component:'vComponent') -> None:
        assert component.name not in self.components, "vSetComponent.add_component: component already added"
        self.components[component.name] = component

    def _dump_use_headers(self, f) -> None:
        package_names = set()
        for component in self.components.values():
            package_names.add(component.package_name)

        for package_name in sorted(package_names):
            print(f"use work.{package_name}.all;", file=f)

    def dump_entity(self, f) -> None:
        print("library ieee;", file=f)
        print("use ieee.std_logic_1164.all;", file=f)

        print("", file=f)
        self._dump_use_headers(f)
        
        print("", file=f)
        print(f"entity {self.name} is", file=f)
        self.dump_port_clause(f)        
        print("end entity;", file=f);

        print("", file=f)
        print(f"architecture structural of {self.name} is", file=f)
        for internal_signal in sorted(self.internal_signals.values(), key=signals_key_fn):
            internal_signal.dump_signal_declaration(f);

        print("begin", file=f);
        for component in sorted(self.components.values(), key=lambda x: x.name):
            component.dump_component_instantiation(f)

        print("end architecture;", file=f);  


# general testbench for the entities
class vTestBench(vEntity):

    def generate(self) -> None:
        # add internal signals and 
        # association list elements for port mapping the components
        for component in self.components.values():
            for port in component.ports.values():
                assert isinstance(port, vPortScalar)
                signal = vSignalScalar(port.name)
                self.add_internal_signal(signal)
                component.add_association_list_element(port, signal)


    def check_consistency(self) -> None:
        assert len(self.ports) == 0, f"vTestBench.check_consistency: ports are not allowed in testbench"


# something like a package in VHDL
# package contains one or more components and can generate a testbench for the package
# the testbench can be used as is or can be used as a template for a custom testbench
class vPackage:
    def __init__(self, name:str):
        assert name is not None and len(name) > 0        
        self.name = name
        self.components = {}  

    def __str__(self) -> str:
        return f"package {self.name}"

    def add_component(self, component:vComponent):
        assert component is not None
        self.components[component.name] = component

    def get_component_by_name(self, component_name:str) -> vComponent:
        assert component_name is not None and len(component_name) > 0
        return self.components.get(component_name, None)

    def dump_package(self, f) -> None:
        assert f is not None
        print("library ieee;", file=f)
        print("use ieee.std_logic_1164.all;", file=f)
        print("", file=f)
        print(f"package {self.name} is", file=f)
        for component in sorted(self.components.values(), key=lambda x: x.name):
            component.dump_component_declaration(f)

        print("end package;", file=f);


class vSystem:
    def __init__(self, referenced_package_vhdl_files:List[str]):
        assert referenced_package_vhdl_files is not None

        self.referenced_packages:Dict[str, vPackage] = {}
        
        for referenced_package_vhdl_file in referenced_package_vhdl_files:
            self._load_referenced_package(referenced_package_vhdl_file)

    # load a referenced package from VHDL file
    def _load_referenced_package(self, filename: str) -> None:
        assert filename is not None and len(filename) > 0
        # Read the file
        with open(filename, 'r') as f:
            content = f.read()
        # Remove comments (-- to end of line)
        content = re.sub(r'--.*', '', content)    
        # Find the first package
        package_match = re.search(r'package\s+(\w+)\s+is\s*(.*?)\s*end\s+package', content, re.DOTALL | re.IGNORECASE)
        assert package_match is not None, f"vSystem._load_referenced_package: package not found in {filename}"
        package_name = package_match.group(1)
        package = vPackage(package_name)
        verbose(f"vSystem._load_referenced_package: package: {package_name}")
        package_content = package_match.group(2)
        # Pattern to match component declarations
        component_pattern = r'component\s+(\w+)\s+is\s*(.*?)\s*end\s+component'
        for comp_match in re.finditer(component_pattern, package_content, re.DOTALL | re.IGNORECASE):
            component_name = comp_match.group(1)
            assert component_name not in package.components, f"Component {component_name} already defined in VHDL file"
            verbose(f"vSystem._load_referenced_package: component: {component_name}")
            component_body = comp_match.group(2)
            component = vComponent(component_name, package_name)
            package.add_component(component)
            # Skip generic if present
            generic_pattern = r'generic\s*\([^)]*\)\s*;'
            component_body = re.sub(generic_pattern, '', component_body, flags=re.IGNORECASE)            
            # Find port declaration
            port_match = re.search(r'port\s*\(\s*(.*?)\s*\)\s*;', component_body, re.DOTALL | re.IGNORECASE)
            assert port_match is not None, f"vSystem._load_referenced_package: port not found in {filename}"                
            port_content = port_match.group(1)
            # Split port declarations by semicolon
            port_declarations = [p.strip() for p in port_content.split(';') if p.strip()]        
            for port_decl in port_declarations:
                port_decl = port_decl.strip()
                assert port_decl is not None, f"vSystem._load_referenced_package: port declaration is empty"
                # Parse port declaration: name : direction type
                # Handle extended identifiers with backslashes
                port_pattern = r'(\\[^\\]+\\|\w+)\s*:\s*(in|out|inout)\s+(\w+)'
                port_match = re.match(port_pattern, port_decl, re.IGNORECASE)
                assert port_match is not None, f"vSystem._load_referenced_package: port declaration is invalid: {port_decl}"
                port_name = port_match.group(1)
                port_mode = port_match.group(2).lower()
                port_type = port_match.group(3)                
                assert port_mode == "in" or port_mode == "out" or port_mode == "inout", f"vSystem._load_referenced_package: port mode is invalid: {port_mode}"
                assert port_type == "std_logic", f"vSystem._load_referenced_package: port type is invalid: {port_type}" 
                component.add_port(vPortScalar(port_name, port_mode))
            
        self.referenced_packages[package.name] = package

    def _resolve_referenced_component_by_name(self, component_name:str) -> vComponent:
        for package in self.referenced_packages.values():
            component = package.get_component_by_name(component_name)
            if component is not None:
                return component
        
        return None

    def add_entity(self, entity:vEntity):
        assert entity is not None
        self.entities[entity.name] = entity    

    def is_signal_used_as_input(self, signal:vSignal, exclude_entity:vEntity=None) -> bool:
        for entity in self.entities.values():
            if exclude_entity is None or entity != exclude_entity:
                if entity.is_signal_used_as_input(signal):
                    return True

        return False

    def is_signal_used_as_output(self, signal:vSignal, exclude_entity:vEntity=None) -> bool:
        for entity in self.entities.values():
            if exclude_entity is None or entity != exclude_entity:
                if entity.is_signal_used_as_output(signal):
                    return True
                    
        return False

    def find_input_usages(self, signal:vSignal, exclude_entity:vEntity=None) -> set:
        assert signal is not None
        usages = set()
        for entity in self.entities.values():
            if exclude_entity is None or entity != exclude_entity:
                usages.update(entity.find_input_usages(signal))

        return usages

    def find_output_usages(self, signal:vSignal, exclude_entity:vEntity=None) -> set:
        assert signal is not None
        usages = set()
        for entity in self.entities.values():
            if exclude_entity is None or entity != exclude_entity:
                usages.update(entity.find_output_usages(signal))

        return usages

    def generate_tb(self, tb_entity_name:str) -> None:
        tb = vTestBench(tb_entity_name, "work")
        for package in self.referenced_packages.values():
            for component in package.components.values():
                tb.add_component(component)

        tb.generate()
        tb.check_consistency()
        return tb


def main():
    parser = argparse.ArgumentParser(
        description="CADR testbench generator")
    
    parser.add_argument(
        "--vhdl-files",
        nargs="+",
        help="One or more VHDL package files containing component definitions")

    parser.add_argument(
        "-v", "--verbose",
        action="store_true",
        help="Verbose")
        
    parser.add_argument(
        "-t", "--testbench-name",
        required=True,
        help="The name of the testbench")

    parser.add_argument(
        "testbench_filepath",
        help="Testbench file path")
    
    args = parser.parse_args()

    global VERBOSE
    VERBOSE = True if args.verbose else False

    system = None

    if args.testbench_name is None:
        print(f"vSystem.main: testbench name not specified", file=sys.stderr)
        parser.print_usage()
        exit(1)

    verbose(f"vSystem.main: testbench name: {args.testbench_name}")

    if args.vhdl_files is None:
        print(f"vSystem.main: VHDL files not specified", file=sys.stderr)
        parser.print_usage()
        exit(1)

    verbose(f"vSystem.main: VHDL files: {args.vhdl_files}")

    system = vSystem(args.vhdl_files)
    tb = system.generate_tb(args.testbench_name)

    verbose(f"vSystem.main: generating testbench file: {args.testbench_filepath}")
    with open(args.testbench_filepath, "w") as f:
        tb.dump_entity(f)


if __name__ == "__main__":
    main()