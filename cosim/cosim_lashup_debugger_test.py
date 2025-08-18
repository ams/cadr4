import socket
import sys

# Server configuration
UDP_IP = "127.0.0.1"
DEFAULT_UDP_PORT = 12345
BUFFER_SIZE = 1024

def main():
    # Parse command line arguments for port
    if len(sys.argv) > 1:
        if sys.argv[1] in ['-h', '--help']:
            print("Usage: python3 cosim_lashup_debugger_test.py [port]")
            print(f"  port: UDP port number (default: {DEFAULT_UDP_PORT})")
            print("Example: python3 cosim_lashup_debugger_test.py 54321")
            return
        
        try:
            UDP_PORT = int(sys.argv[1])
        except ValueError:
            print(f"Error: Invalid port number '{sys.argv[1]}'. Using default port {DEFAULT_UDP_PORT}")
            UDP_PORT = DEFAULT_UDP_PORT
    else:
        UDP_PORT = DEFAULT_UDP_PORT
    
    print(f"Connecting to UDP server at {UDP_IP}:{UDP_PORT}")
    # Create a UDP socket
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.settimeout(5) # Set a 5-second timeout
    except socket.error as e:
        print(f"Failed to create socket: {e}")
        return

    # --- Test 1: Write a value to address 1 ---
    try:
        # Command: W <addr> <data> (hex without 0x)
        write_cmd = "W 1 AAAA"
        print(f"Sending: '{write_cmd}'")
        sock.sendto(write_cmd.encode(), (UDP_IP, UDP_PORT))
        
        # Receive response
        data, addr = sock.recvfrom(BUFFER_SIZE)
        response = data.decode()
        print(f"Received response: '{response}'")
        if response != "0":
            print(f"FAILURE: Expected '0' but got '{response}'")

    except socket.timeout:
        print("Write request timed out.")
    except socket.error as e:
        print(f"Socket error during write: {e}")


    # --- Test 2: Read back the value from address 1 ---
    try:
        # Command: R <addr> (hex without 0x)
        read_cmd = "R 1"
        print(f"\nSending: '{read_cmd}'")
        sock.sendto(read_cmd.encode(), (UDP_IP, UDP_PORT))

        # Receive response
        data, addr = sock.recvfrom(BUFFER_SIZE)
        response = data.decode()
        print(f"Received response: '{response}'")
        
        # Verification - response should be "0 AAAA" (hex without 0x)
        parts = response.split()
        if len(parts) == 2 and parts[0] == "0" and parts[1].upper() == "AAAA":
            print("SUCCESS: Read back the correct value.")
        else:
            print(f"FAILURE: Expected '0 AAAA', but got '{response}'.")

    except socket.timeout:
        print("Read request timed out.")
    except socket.error as e:
        print(f"Socket error during read: {e}")

    # --- Test 3: Test all 4 memory addresses ---
    print("\n--- Testing all 4 memory addresses ---")
    test_values = ["DEAD", "BEEF", "CAFE", "BABE"]
    
    # Write to all addresses
    for addr in range(4):
        try:
            write_cmd = f"W {addr:X} {test_values[addr]}"
            print(f"Writing to addr {addr}: '{write_cmd}'")
            sock.sendto(write_cmd.encode(), (UDP_IP, UDP_PORT))
            
            data, _ = sock.recvfrom(BUFFER_SIZE)
            response = data.decode()
            if response != "0":
                print(f"FAILURE: Write to addr {addr} failed: '{response}'")
        except (socket.timeout, socket.error) as e:
            print(f"Error writing to addr {addr}: {e}")
    
    # Read from all addresses
    for addr in range(4):
        try:
            read_cmd = f"R {addr:X}"
            print(f"Reading from addr {addr}: '{read_cmd}'")
            sock.sendto(read_cmd.encode(), (UDP_IP, UDP_PORT))
            
            data, _ = sock.recvfrom(BUFFER_SIZE)
            response = data.decode()
            parts = response.split()
            if len(parts) == 2 and parts[0] == "0" and parts[1].upper() == test_values[addr]:
                print(f"SUCCESS: Addr {addr} = {parts[1]}")
            else:
                print(f"FAILURE: Addr {addr} expected '{test_values[addr]}', got '{response}'")
        except (socket.timeout, socket.error) as e:
            print(f"Error reading from addr {addr}: {e}")

    sock.close()

if __name__ == "__main__":
    main()
