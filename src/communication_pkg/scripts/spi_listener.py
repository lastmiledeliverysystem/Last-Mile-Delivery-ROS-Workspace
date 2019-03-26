#!/usr/bin/python3.5
import rospy
from control_pkg.msg import Diff_drive
import spidev

spi = spidev.SpiDev()
spi.open(0,0)
spi.max_speed_hz= 50000
spi.mode = 0


def callback(data):
    global spi
    vSign= 0
    wSign= 0
    vHex= data.v
    wHex= data.w

    if vHex < 0:
       vHex = -vHex
       vSign = 1

    if wHex < 0:
        wHex = -wHex
        wSign = 1 
        
    rospy.loginfo(vHex)
    rospy.loginfo(wHex)

    vHex= int(hex(int(vHex)), 16)
    wHex= int(hex(int(wHex)), 16)

    resp = spi.xfer([vHex])
    resp = spi.xfer([vSign])
    resp = spi.xfer([wHex])
    resp = spi.xfer([wSign])


def listener():
    rospy.init_node('spi_node', anonymous=True)

    rospy.Subscriber('keyboard_topic', Diff_drive, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()