import serial
import time
import struct

ser = serial.Serial(port="/dev/ttyACM2", baudrate = 9600,write_timeout=0, timeout=None)
time.sleep(2)

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
    
print(b)
ser.write(b)

time.sleep(10)
ser.write(b)
