import serial

with serial.Serial('/dev/cu.usbmodem1421', 250000, timeout=1) as ser:

    for i in range(10):
        ser.write(b'h')
        print(ser.read(8))          # read one byte

#"�ello World!"
