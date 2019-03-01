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
    #rospy.loginfo(rospy.get_caller_id() + 'Velocity is: %s', data.v)
   
    vHex = int(hex(int(data.v)), 16)
    resp = spi.xfer([vHex])
    resp = spi.xfer([0x00])
    wHex = int(hex(int(data.w)), 16)
    resp = spi.xfer([wHex])
    resp = spi.xfer([0x00])


def listener():
    rospy.init_node('spi_node', anonymous=True)

    rospy.Subscriber('keyboard_topic', Diff_drive, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()