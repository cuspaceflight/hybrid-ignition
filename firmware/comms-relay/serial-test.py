import serial
import time
import struct

ser = serial.Serial(port="/dev/ttyACM2", baudrate = 9600, write_timeout=0, timeout=None)

b = struct.pack('<B', 126)
for i in range(0,128):

    if(i == 126):
        b += struct.pack('<B',125)
        b += struct.pack('<B', 94)
    elif(i == 125):
        b += struct.pack('<B', 125)
        b += struct.pack('<B', 93)
    else:
        b += struct.pack('<B', i)
    
while True:
    time.sleep(0.05)
    ser.write(b)
