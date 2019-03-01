#!/usr/bin/python3.5
import rospy
from sensors_pkg.msg import Imu


def callback(data):

    rospy.loginfo(rospy.get_caller_id() + 'I heard %s', data)

def listener():

    rospy.init_node('imu_listener', anonymous=True)

    rospy.Subscriber('imu_topic', Imu, callback)
    
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()


if __name__ == '__main__':
    listener()
   