import serial

positions_file = open("positions_fpga.txt", "a")

with serial.Serial('/dev/ttyACM0', 250000, timeout=1) as ser:
    previous = ""
    ser.write(b'h')
    for i in range(1024):
        while 

        ser.write(b'h')
        positions_file.write(repr(ser.read(1)))
        positions_file.write("\n")
