#!/usr/bin/python3.5
import rospy
from std_msgs.msg import String, Float32
from sensors_pkg.msg import Gps
import time
import serial
import pynmea2
ser = serial.Serial("/dev/ttyS0", 9600, timeout=3)


def talker():
    pub = rospy.Publisher('gps_topic', Gps, queue_size=10)
    rospy.init_node('gps_node', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    msg=Gps()
    
    while not rospy.is_shutdown():
        output = ser.readline()
        output = output.decode()
        if output.find('GGA') > 0 : # the long and lat data are always contained in the GPGGA string of the NMEA data
            
            data = pynmea2.parse(output)
            #parse the latitude and print
            msg.lat = data.lat
            #concatlat = "lat:" + str(latval)
    
            #parse the longitude and print
            msg.long = data.lon
            #concatlong = "long:"+ str(longval)
            
            #output = (concatlat, concatlong)

            rospy.loginfo(msg)
            pub.publish(msg)
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass