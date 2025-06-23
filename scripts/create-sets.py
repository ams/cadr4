#!/usr/bin/env python3
#
# This script is used for port pruning and bus bundling.
#
# In cadr4, this script is used to generate new entities (under set package, 
# under set folder) that wraps or groups cadr entities.
#
# Main reasons or benefits of this are:
#
# - unused signals in cadr4 are pruned (like many outputs in clock) 
#   (pruned means either termianted with open or '0')
# - the signals used only within a new entity are not visible to the outside
# - the signals are bundled into buses, so a lot less are visible and they are
#   much easier to visualize in waveform viewers
# - a testbench is created either to be used as is or to be used as a template
#
# There were over 1.5K? signals in cadr_tb before, which was using cadr 
# entities. Now, in set_tb.vhd, there are only over 300 signals.
#
# Hint: Since all the unused signals are pruned, if a particular signal is 
# required in a testbench, an entity can be created with an in port for this
# signal. This will prevent the pruning of the signal.
#
# Running the script will result (assuming the package name is set):
# - a package file containing all new entities (e.g. set.vhd)
# - a testbench file using all new entities (e.g. set_tb.vhd)
# - a number of new entity files (<entity_name>_set.vhd)
#
# Limitations:
# - generics not supported
# - the bus bundling logic is not yet very sophisticated
#
# The idea is given a large set of entities, some of these entities are 
# more connected to each other because they together form a particular 
# function. This means if a new entity is created which instantiates the 
# functional entities, the new entity will have less external ports than 
# the combination of the entities it wraps, because some of these ports can be 
# connected with internal signals. This is called port pruning.
#
# Port pruning is also removing all the signals by terminating them with '0' or
# open if they are not used anywhere else in the system.
#
# Port pruning rules:
# (A and B will form a set S)
#
# | A   | B   | System | S     | Result |
# | --- | --- | ------ | ----- | ----- |
# | in  | -   | -      | -     | pruned, terminated with '0'  |
# | out | -   | -      | -     | pruned, terminated with open |
# | in  | -   | out    | in    | |
# | in  | out | -      | int   | pruned, made an internal signal of S |
# | in  | out | in     | out   | |
# | in  | out | out    | inout | |
#
# Also, the ports of the entities might be given as scalars (std_logic) 
# rather than arrays (std_logic_vector). This might be inconvenient both 
# for wiring up the entities and for debugging. The scalar signals can be 
# bundled into a bus by using a simple regex pattern. For example, ports 
# pc0, pc1, pc2 can be merged into PC bus. This is called bus bundling. 
#
# Bus bundling rules (assuming a bus name PC):
#
# | Port 1 | Port 2 | Bundled Ports  | Not Bundled Ports |
# | ------ | ------ | -------------- | ----------------- |
# | pc0..9 | -      | PC             |                   |
# | pc0..4 | pc6..9 | PC_4_0, PC_9_6 |                   |
# | pc3..6 | -      | PC_6_3         |                   |
# | pc3..6 | pc8    | PC_6_3         | pc8               |
#
# A testbench instantiating all the new entities/components can be generated.
# The testbench will have internal signals for all ports of the new components. 
# The width of the buses will be derived from the ranges of the ports it is 
# used.

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


# the base class representing a signal in VHDL
# this is not directly used, its subclasses, vSignalScalar and vSignalArray, are used
class vSignal:
    def __init__(self, name:str, **kwargs):                
        super().__init__(**kwargs)
        assert name is not None and len(name) > 0
        self.name:str = name

    def __str__(self) -> str:
        return f"signal {self.name}: {self.get_type()}"

    def dump_signal_declaration(self, f) -> None:
        print(f"  signal {self.name}: {self.get_type()};", file=f)


# std_logic scalar signal in VHDL
class vSignalScalar(vSignal):
    def __init__(self, name:str, **kwargs):                
        super().__init__(name, **kwargs)

    def get_type(self) -> str:
        return "std_logic"


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
        print(f"      {self.name}: {self.mode} {self.get_type()}{semicolon}", file=f)


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
                print(f"    {self.name} => '0'{comma}", file=f)

            else:
                print(f"    {self.name} => open{comma}", file=f)

        else:
            associated_signal, idx, _ = associated_signal_element
            if isinstance(associated_signal, vSignalScalar):
                print(f"    {self.name} => {associated_signal.name}{comma}", file=f)

            elif isinstance(associated_signal, vSignalArray):
                print(f"    {self.name} => {associated_signal.name}({idx}){comma}", file=f)

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
                print(f"    {self.name} => (others => '0'){comma}", file=f)

            else:
                # (others => open) is not allowed
                print(f"    {self.name} => open{comma}", file=f)

        else:
            associated_signal, low, high = associated_signal_element
            if isinstance(associated_signal, vSignalScalar):
                assert False, "vPortArray.dump_association_element: associated_signal is a vSignalScalar"

            elif isinstance(associated_signal, vSignalArray):
                print(f"    {self.name} => {associated_signal.name}({high} downto {low}){comma}", file=f)

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
                port.dump_port_declaration(f, do_not_add_semicolon=(i == (len(ports) - 1)))
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
        for i, port in enumerate(ports):
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

    def check_consistency(self) -> None:
        # check port and internal signal name uniqueness
        port_and_signal_names = set()
        for port in self.ports.values():
            assert port.name not in port_and_signal_names, f"vEntity.check_consistency: port {port.name} already exists"
            port_and_signal_names.add(port.name)

        for signal in self.internal_signals.values():
            assert signal.name not in port_and_signal_names, f"vEntity.check_consistency: signal {signal.name} already exists"
            port_and_signal_names.add(signal.name)

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

    def remove_port_by_name(self, name:str) -> None:
        assert name is not None and len(name) > 0
        if name in self.ports:
            del self.ports[name]

    def add_internal_signal(self, signal:vSignal) -> None:
        assert signal is not None
        self.internal_signals[signal.name] = signal

    def remove_internal_signal_by_name(self, name:str) -> None:
        assert name is not None and len(name) > 0
        if name in self.internal_signals:
            del self.internal_signals[name]

    def get_internal_signal_by_name(self, name:str) -> vSignal:
        assert name is not None and len(name) > 0
        return self.internal_signals.get(name, None)

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

    def bundle_bus_ports(self, bus_name_regex_dict:Dict[str, re.Pattern]) -> None:
        assert bus_name_regex_dict is not None
        # (bus_base_name, mode) -> [bus_indices]
        bus_candidates = {}

        # (bus_base_name, mode, index) -> port
        bus_to_port = {}

        # bus candidates are created considering the port mode
        # because start and end indices are only created for the same mode
        for port in self.ports.values():
            for bus_name, (pattern_scalar, pattern_array) in bus_name_regex_dict.items():
                match = pattern_scalar.match(port.name)
                if match:
                    bus_index = int(match.group(1))
                    bus_key = (bus_name, port.mode)
                    if bus_key not in bus_candidates:
                        bus_candidates[bus_key] = []

                    bus_candidates[bus_key].append(bus_index)
                    bus_to_port[(bus_name, port.mode, bus_index)] = port

        # early return if there are no bus candidates
        if len(bus_candidates) == 0:
            return

        # sort bus indices, it will be assumed they are sorted in further processes
        bus_candidates = {bus_key: sorted(bus_indices) for bus_key, bus_indices in bus_candidates.items()}
        
        # (bus_name, signal_name, slice_num, mode, start, end)
        # bus_name is for example PC
        # signal_name is the actual one that will be dumped to vhd, it can be the same as bus_base_name 
        # but if there are multiple slices, then it will be different (e.g. PC_3_0)
        buses = []

        # look at each bus candidates' indices
        # if indices are contiguous, it is ok, there is single bus
        # if indices are not contiguous, there are different slices, create a different bus for each slice
        # the name of the bus for each slice is corrected later
        for bus_key, bus_indices in bus_candidates.items():
            bus_name, mode = bus_key
            slice_num = 0
            # initial name of the signal is the same as bus_name, but it might be renamed later
            buses.append([bus_name, bus_name, slice_num, mode, bus_indices[0], bus_indices[-1]])
            for i in range(1, len(bus_indices)):
                # if the current index = last index + 1, it means it is contiguous, so continue
                if (bus_indices[i-1]+1) == bus_indices[i]:
                    pass

                # if not, there are different slices e.g. PC_3_0, PC_7_5, since 4 is missing, it cannot be PC_7_0
                else:
                    # adjust the end value of last slice
                    buses[-1][5] = bus_indices[i-1]
                    # add a new slice, optimistically using the last index as end
                    slice_num += 1
                    buses.append([bus_name, bus_name, slice_num, mode, bus_indices[i], bus_indices[-1]])

        def _commented_out():
            # if a bus_name is used twice (it has more than one slices), rename both with end and start e.g. BUS_END_START e.g. PC_5_3
            # if there is only one slice of a bus, use the name as it is e.g. PC
            last_bus_name = buses[0][1]
            for i in range(1, len(buses)):
                bus_name, signal_name, slice_num, mode, start, end = buses[i]
                if bus_name == last_bus_name:
                    #short_mod = "i" if mode == "in" else "o" if mode == "out" else "io"
                    short_mod = ""
                    # change the first slice also (e.g. PC -> PC_3_0)
                    if slice_num == 1:
                        prev_bus_name, _, _, _, prev_start, prev_end = buses[i-1]
                        prev_signal_name = f"{prev_bus_name}{short_mod}_{prev_end}_{prev_start}"
                        buses[i-1][1] = prev_signal_name
                    
                    # change the name of the current slice
                    signal_name = f"{bus_name}{short_mod}_{end}_{start}"
                    buses[i][1] = signal_name

                last_bus_name = bus_name

        # recreate signal names
        for i in range(0, len(buses)):
            bus_name, _, _, _, start, end = buses[i]
            buses[i][1] = f"{bus_name}_{end}_{start}"

        # add bus/array ports, remove the scalar ports it replaces
        for (bus_name, signal_name, slice_num, mode, start, end) in buses:
            if (end > start):                
                bus_port = vPortArray(signal_name, bus_name, start, end, mode)
                self.add_port(bus_port)
                # modify association
                # 1. find ports having association to the port to be replaced (by name)
                # 2. add association to the bus_port with bus index
                # end+1 below because port range is inclusive
                for i in range(start, end+1):
                    port_replaced_by_bus = bus_to_port[(bus_name, mode, i)]    
                    for component in self.components.values():
                        for port in component.ports.values():
                            if port in component.association_list_elements:
                                (signal, low, high) = component.association_list_elements[port]
                                if signal.name == port_replaced_by_bus.name:
                                    component.add_association_list_element(port, bus_port, i)

                    self.remove_port_by_name(port_replaced_by_bus.name)


# general testbench for the entities
class vTestBench(vEntity):

    def generate(self, bus_name_regex_dict:Dict[str, re.Pattern]) -> None:
        # find the range of buses to be added
        bus_dict = {}
        for component in self.components.values():
            for port in component.ports.values():
                if isinstance(port, vPortArray):
                    (low, high) = bus_dict.get(port.bus_name, (100, -1))
                    low = min(low, port.low)
                    high = max(high, port.high)
                    bus_dict[port.bus_name] = (low, high)
                    verbose(f"vTestBench.generate: bus {port.bus_name} range: {low} to {high} due to: {port.name}")
                
                elif isinstance(port, vPortScalar):
                    for bus_name, (pattern_scalar, pattern_array) in bus_name_regex_dict.items():
                        match = pattern_scalar.match(port.name)
                        if match:
                            bus_idx = int(match.group(1))
                            (low, high) = bus_dict.get(bus_name, (100, -1))
                            low = min(low, bus_idx)
                            high = max(high, bus_idx)
                            bus_dict[bus_name] = (low, high)
                            verbose(f"vTestBench.generate: bus {bus_name} range: {low} to {high} due to: {port.name}")
                            break

                else:
                    assert False, f"vTestBench.generate: unexpected port type: {type(port)}"
        
        # add bus signals
        for bus_name, (low, high) in bus_dict.items():
            bus = vSignalArray(bus_name, bus_name, low, high)
            self.add_internal_signal(bus)

        # add association list elements
        for component in self.components.values():
            for port in component.ports.values():
                if isinstance(port, vPortArray):
                    assert port.bus_name in self.internal_signals, f"vTestBench.generate: bus {port.bus_name} not found"
                    bus = self.internal_signals[port.bus_name]
                    component.add_association_list_element(port, bus, port.low, port.high)
                
                elif isinstance(port, vPortScalar):
                    # the port might be assigned from a bus
                    # for example ir42, should be assigned from IR(42)
                    assigned_from_bus = False
                    for bus_name, (pattern_scalar, pattern_array) in bus_name_regex_dict.items():
                        match = pattern_scalar.match(port.name)
                        if match and bus_name in self.internal_signals:
                            assigned_from_bus = True
                            bus_idx = int(match.group(1))
                            component.add_association_list_element(port, self.internal_signals[bus_name], bus_idx)
                            break

                    if not assigned_from_bus:
                        signal = vSignalScalar(port.name)
                        self.add_internal_signal(signal)
                        component.add_association_list_element(port, signal)

                else:
                    assert False, f"vTestBench.generate: unexpected port type: {type(port)}"


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
    def __init__(self, package_name:str, referenced_package_vhdl_files:List[str], entity_list_file:str, bus_list_file:str):
        assert package_name is not None and len(package_name) > 0
        assert referenced_package_vhdl_files is not None
        assert entity_list_file is not None and len(entity_list_file) > 0

        self.package_name = package_name
        self.referenced_packages:Dict[str, vPackage] = {}
        self.entities:Dict[str, vEntity] = {}
        self.bus_name_regex_dict:Dict[str, re.Pattern] = {}
        self.tb = None
        
        for referenced_package_vhdl_file in referenced_package_vhdl_files:
            self._load_referenced_package(referenced_package_vhdl_file)

        self._load_entity_list_file(entity_list_file)

        if bus_list_file is not None:
            self._load_bus_list_file(bus_list_file)        

    def as_package(self) -> 'vPackage':
        package = vPackage(self.package_name)
        for entity in self.entities.values():
            package.add_component(entity.as_component())

        return package

    def check_consistency(self) -> None:
        for entity in self.entities.values():
            entity.check_consistency()

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

    # loads entity list file
    # format: entity_name component_name1 component_name2 ...
    def _load_entity_list_file(self, filename: str):
        assert filename is not None and len(filename) > 0
        entities_dict = {}   
        with open(filename, 'r') as file:
            for line in file:
                line = line.strip()
                if line and line[0] != '#':  # Skip empty lines and comments
                    words = [word.strip() for word in line.split()]
                    if len(words) > 1:
                        entity_name = words[0]
                        components = set(words[1:])                        
                        for component_name in components:
                            assert self._resolve_referenced_component_by_name(component_name) is not None, f"vSystem.load_set_list_file: component {component_name} not found in referenced packages"

                        entities_dict[entity_name] = components
        
        for entity_name, components in entities_dict.items():
            entity = vEntity(entity_name, self.package_name)
            for component_name in components:
                entity.add_component(self._resolve_referenced_component_by_name(component_name))

            self.entities[entity.name] = entity

    # loads bus list file
    # format: bus_name
    def _load_bus_list_file(self, filename: str) -> list:
        assert filename is not None and len(filename) > 0
        with open(filename, 'r') as file:
            for line in file:
                bus_name = line.strip()
                if bus_name and bus_name[0] != '#':  # Skip empty lines and comments
                    # take the first word as bus name
                    bus_name = line.split()[0]
                    # Create regex pattern: bus_name followed by one or two digits
                    # If first digit is 0, there cannot be a second digit
                    # Pattern scalar: busX
                    # Pattern array: bus_X_Y
                    pattern_scalar = f"{re.escape(bus_name.lower())}(0|[1-9][0-9]?)$"
                    pattern_array = f"{re.escape(bus_name.lower())}_(0|[1-9][0-9]?)_(0|[1-9][0-9]?)$"
                    self.bus_name_regex_dict[bus_name] = (re.compile(pattern_scalar), re.compile(pattern_array))

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

    def merge_entities(self) -> None:
        verbose("vSystem.merge_entities")
        for entity in self.entities.values():
            verbose(f"entity: {entity.name}")
            for component in entity.components.values():
                verbose(f"  component: {component.name}")
                
                for out_port in component.out_ports():
                    verbose(f"    out_port: {out_port.name}")
                    
                    is_input_to_aliens = self.is_signal_used_as_input(out_port, entity)
                    is_input_to_siblings = entity.is_signal_used_as_input(out_port)

                    verbose(f"    is_input_to_aliens: {is_input_to_aliens} - {[x.name for x in self.find_input_usages(out_port, entity)]}")
                    verbose(f"    is_input_to_siblings: {is_input_to_siblings} - {[x.name for x in entity.find_input_usages(out_port)]}")

                    existing_port = entity.ports.get(out_port.name, None)

                    verbose(f"    existing_port: {existing_port}")

                    # input to aliens ? then out port needed
                    # this also covers the case it is both input to aliens and siblings
                    if is_input_to_aliens:
                        if existing_port is not None:
                            component.add_association_list_element(out_port, existing_port)
                            if existing_port.mode == "out" or existing_port.mode == "inout":
                                verbose(f"    there is already a {existing_port.mode} port for out port: {out_port.name}")

                            elif existing_port.mode == "in":
                                verbose(f"    changing {existing_port.mode} port to inout for out port: {out_port.name}")
                                existing_port.mode = "inout"

                            else:
                                assert False, f"vSystem.merge_entities: unexpected port mode: {existing_port.mode}"

                        else:
                            verbose(f"    adding out port for out port: {out_port.name}")
                            new_port = vPortScalar(out_port.name, "out")
                            entity.add_port(new_port)
                            component.add_association_list_element(out_port, new_port)
                            # remove internal signal if there is one, since it is replaced by the new port
                            entity.remove_internal_signal_by_name(new_port.name)
                    
                    # input to siblings only ? then use it as internal signal
                    # or nobody outputs it, but maybe it is used internally, create an internal signal
                    else:
                        if existing_port is not None:
                            verbose(f"    there is already a {existing_port.mode} port for out port: {out_port.name}")
                            component.add_association_list_element(out_port, existing_port)
                        else:
                            verbose(f"    adding internal signal for out port: {out_port.name}")
                            new_signal = vSignalScalar(out_port.name)
                            entity.add_internal_signal(new_signal)
                            component.add_association_list_element(out_port, new_signal)
                    
                for in_port in component.in_ports():
                    verbose(f"    in_port: {in_port.name}")

                    is_output_from_aliens = self.is_signal_used_as_output(in_port, entity)
                    is_output_from_siblings = entity.is_signal_used_as_output(in_port)

                    verbose(f"    is_output_from_aliens: {is_output_from_aliens} - {[x.name for x in self.find_output_usages(in_port, entity)]}")
                    verbose(f"    is_output_from_siblings: {is_output_from_siblings} - {[x.name for x in entity.find_output_usages(in_port)]}")

                    existing_port = entity.ports.get(in_port.name, None)

                    verbose(f"    existing_port: {existing_port}")

                    # output from aliens ? then in port needed
                    if is_output_from_aliens:
                        # this is important
                        # if it is also driven by siblings, "in" is not enough
                        # because an "in" port signal cannot be driven
                        # so it has to be "inout" in that case
                        required_mode = "inout" if is_output_from_siblings else "in"

                        if existing_port is not None:
                            component.add_association_list_element(in_port, existing_port)
                            if existing_port.mode == "inout":
                                verbose(f"    there is already a {existing_port.mode} port for in port: {in_port.name}")

                            elif existing_port.mode == "in":
                                if required_mode == "inout":
                                    verbose(f"    changing {existing_port.mode} port to {required_mode} for in port: {in_port.name}")
                                    existing_port.mode = "inout"

                                else:
                                    verbose(f"    there is already a {existing_port.mode} port for in port: {in_port.name}")

                            elif existing_port.mode == "out":
                                verbose(f"    changing {existing_port.mode} port to inout for in port: {in_port.name}")
                                existing_port.mode = "inout"

                            else:
                                assert False, f"vSystem.merge_entities: unexpected port mode: {existing_port.mode}"

                        else:
                            verbose(f"    adding {required_mode} port for in port: {in_port.name}")
                            new_port = vPortScalar(in_port.name, required_mode)
                            entity.add_port(new_port)
                            component.add_association_list_element(in_port, new_port)
                            # remove internal signal if there is one, since it is replaced by the new port
                            entity.remove_internal_signal_by_name(new_port.name)
                    
                    # output from siblings only ? then use it as internal signal
                    # or nobody outputs it, but maybe it is used internally, create an internal signal
                    else:
                        if existing_port is not None:
                            verbose(f"    there is already a {existing_port.mode} port for in port: {in_port.name}")
                            component.add_association_list_element(in_port, existing_port)
                        else:
                            verbose(f"    adding internal signal for in port: {in_port.name}")
                            new_signal = vSignalScalar(in_port.name)
                            entity.add_internal_signal(new_signal)
                            component.add_association_list_element(in_port, new_signal)

    def bundle_bus_ports(self) -> None:
        assert self.bus_name_regex_dict is not None
        if len(self.bus_name_regex_dict) > 0:
            for entity in self.entities.values():
                entity.bundle_bus_ports(self.bus_name_regex_dict)

    def generate_tb(self, tb_entity_name:str) -> None:
        assert self.bus_name_regex_dict is not None
        assert self.tb is None, "vPackage.generate_tb: testbench already generated"
        tb_entity = vTestBench(tb_entity_name, self.package_name)
        for entity in self.entities.values():
            tb_entity.add_component(entity.as_component())

        tb_entity.generate(self.bus_name_regex_dict)
        return tb_entity


def main():
    parser = argparse.ArgumentParser(
        description="VHDL port-pruning and bus-bundling utility")
    
    parser.add_argument(
        "-u", "--use-cache",
        action="store_true",
        help="use cache")    
    
    parser.add_argument(
        "-e", "--entity_list_file",
        help="File containing what new entities wrap what components")
    
    parser.add_argument(
        "-b", "--bus_list_file",
        help="File containing bus signal names")
    
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
        required=True,
        help="Output dir")

    parser.add_argument(
        "--generate",
        required=True,
        choices=["cache", "package", "tb", "entity"],
        help="generate action")

    parser.add_argument(
        "--entity",
        help="entity to generate")

    parser.add_argument(
        "-p", "--package-name",
        required=True,
        help="Package name")
    
    args = parser.parse_args()

    global VERBOSE
    VERBOSE = True if args.verbose else False

    system = None

    if args.package_name is None:
        print(f"vSystem.main: package name not specified", file=sys.stderr)
        parser.print_usage()
        exit(1)

    verbose(f"vSystem.main: package name: {args.package_name}")

    if args.output_dir is None:
        print(f"vSystem.main: output dir not specified", file=sys.stderr)
        parser.print_usage()
        exit(1)

    verbose(f"vSystem.main: output dir: {args.output_dir}")

    if args.use_cache:

        cache_file = f"{args.package_name}.cache"
        fpath = os.path.join(args.output_dir, cache_file)
        verbose(f"vSystem.main: using cache file: {fpath}")
        with open(fpath, "rb") as f:
            system = pickle.load(f)

    else:

        if args.vhdl_files is None:
            print(f"vSystem.main: VHDL files not specified", file=sys.stderr)
            parser.print_usage()
            exit(1)

        verbose(f"vSystem.main: VHDL files: {args.vhdl_files}")

        if args.entity_list_file is None:
            print("vSystem.main: entity list file not specified", file=sys.stderr)
            parser.print_usage()
            exit(1)

        verbose(f"vSystem.main: entity list file: {args.entity_list_file}")

        if args.bus_list_file is None:
            print("no bus list file is specified, bus bundling is disabled", file=sys.stderr)

        verbose(f"vSystem.main: bus list file: {args.bus_list_file}")

        system = vSystem(
            args.package_name, 
            args.vhdl_files, 
            args.entity_list_file, 
            args.bus_list_file)

        # this is where magic happens
        system.merge_entities()
        system.bundle_bus_ports()
        system.check_consistency()

    if args.generate == "cache":

        cache_file = f"{args.package_name}.cache"
        fpath = os.path.join(args.output_dir, cache_file)
        verbose(f"vSystem.main: generating cache file: {fpath}")
        with open(fpath, "wb") as f:
            pickle.dump(system, f)

    elif args.generate == "package":

        package_file = f"{args.package_name}.vhd"
        verbose(f"vSystem.main: generating package file: {package_file}")
        fpath = os.path.join(args.output_dir, package_file)
        with open(fpath, "w") as f:
            system.as_package().dump_package(f)
        
    elif args.generate == "tb":

        tb_entity_name = f"{args.package_name}_tb"
        tb_file = f"{tb_entity_name}.vhd"
        verbose(f"vSystem.main: generating testbench file: {tb_file}")
        fpath = os.path.join(args.output_dir, tb_file)
        with open(fpath, "w") as f:
            system.generate_tb(tb_entity_name).dump_entity(f)

    elif args.generate == "entity":

        if args.entity is None:
            print("vSystem.main: entity not specified", file=sys.stderr)
            parser.print_usage()
            exit(1)

        if args.entity not in system.entities:
            print(f"vSystem.main: entity {args.entity} not found", file=sys.stderr)
            parser.print_usage()
            exit(1)

        entity_file = f"{args.entity}.vhd"
        verbose(f"vSystem.main: generating entity file: {entity_file}")
        fpath = os.path.join(args.output_dir, entity_file)
        with open(fpath, "w") as f:
            system.entities[args.entity].dump_entity(f)

    else:

        print("vPackage.dump_package: no action (generate_cache, generate-package, generate-tb, generate-entity) specified", file=sys.stderr)
        parser.print_usage()
        sys.exit(1)


if __name__ == "__main__":
    main()