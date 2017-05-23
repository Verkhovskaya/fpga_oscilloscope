import serial

with serial.Serial('/dev/cu.usbmodem1421', 250000, timeout=1) as ser:

    for i in range(32):
        ser.write(b'h')
        print(repr(ser.read(1)))      # read one byte
