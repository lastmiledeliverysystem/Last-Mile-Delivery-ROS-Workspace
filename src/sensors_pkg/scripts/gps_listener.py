#!/usr/bin/python3.5
import rospy
from sensors_pkg.msg import Gps

def callback(data):
    rospy.loginfo(rospy.get_caller_id() + 'I heard %s', data.lat)

def listener():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('imu_listener', anonymous=True)

    rospy.Subscriber('imu_topic', Gps, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()
