#!/usr/bin/python3.5
import rospy
from sensors_pkg.msg import Camera
import socket
import pickle
import cv2
import sys

counter = 0 


def callback(data):
    global counter
    frame =(pickle.loads(data.image))
    # c, address = s.accept()
    # print("get conn from: ", address)
    # c.send(frame)

    img_name = "/home/pi/img_{}.png".format(counter)
    cv2.imwrite(img_name, frame)
    counter += 1 


def listener():
    
    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.

    rospy.init_node('socket_node', anonymous=True)

    rospy.Subscriber('camera_topic', Camera, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()
   
    

if __name__ == '__main__':
    # s = socket.socket()
    print("socket successfully created")
    # s.bind(("",5000))
    # s.listen(5) # Accepts up to 5 connections.
    print("socket listening")
    listener()
    # s.close()

