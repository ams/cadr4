import socket
import sys
import time

# Server configuration
UDP_IP = "127.0.0.1"
DEFAULT_UDP_PORT = 12345
BUFFER_SIZE = 1024

def main():
    # Parse command line arguments for port
    if len(sys.argv) > 1:
        if sys.argv[1] in ['-h', '--help']:
            print("Usage: python3 cosim_lashup_debugger_boot.py [port]")
            print(f"  port: UDP port number (default: {DEFAULT_UDP_PORT})")
            print("Example: python3 cosim_lashup_debugger_boot.py 54321")
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

    # mode register is #o766012
    mode_register_addr = 0o766012
    mode_register_addr_bits_16_1 = (mode_register_addr >> 1) & 0xFFFF
    mode_register_addr_bit_17 = (mode_register_addr >> 17) & 0x1

    # set PROG.BOOT (7th bit of mode register)
    mode_register_val = (1 << 7) & 0xFFFF

    # Boot sequence
    boot_commands = [
        (3, mode_register_addr_bits_16_1),
        (2, mode_register_addr_bit_17),
        (0, mode_register_val)
    ]

    print("Sending boot sequence...")
    
    for addr, value in boot_commands:

        time.sleep(0.1)

        try:
            
            write_cmd = f"W {addr:X} {value:04X}"
            print(f"Writing {value:04X} to address {addr:X}: '{write_cmd}'")
            sock.sendto(write_cmd.encode(), (UDP_IP, UDP_PORT))
            
            # Receive response
            data, _ = sock.recvfrom(BUFFER_SIZE)
            response = data.decode()
            
            if response == "0":
                print(f"SUCCESS: Write to address {addr:X} completed")
            else:
                print(f"FAILURE: Write to address {addr:X} failed with response: '{response}'")            

        except socket.timeout:
            print(f"Write to address {addr:X} timed out")
        except socket.error as e:
            print(f"Socket error during write to address {addr:X}: {e}")

    print("Boot sequence sent.")
    sock.close()

if __name__ == "__main__":
    main()
