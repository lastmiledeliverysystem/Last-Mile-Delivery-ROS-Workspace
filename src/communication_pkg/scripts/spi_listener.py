#!/usr/bin/python3.5
import rospy
from control_pkg.msg import Diff_drive
import serial
import struct

ser = serial.Serial('/dev/ttyACM0',9600)


def callback(data):
    dataToSend=[]
    vSign= 0
    wSign= 0
    vHex= data.v
    wHex= data.w

    rospy.loginfo(vHex)
    rospy.loginfo(wHex)
    
    if vHex < 0:
       vHex = -vHex
       vSign = 1

    if wHex < 0:
        wHex = -wHex
        wSign = 1 

    dataToSend.append(int(vHex))
    dataToSend.append(int(vSign))
    dataToSend.append(int(wHex))
    dataToSend.append(int(wSign))
  
    

    for item in dataToSend:
        ser.write(struct.pack('>B',item))


def listener():
    rospy.init_node('spi_node', anonymous=True)

    rospy.Subscriber('keyboard_topic', Diff_drive, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()