#!/usr/bin/python2.7
import rospy
import message_filters
from sensors_pkg.msg import Camera
from control_pkg.msg import Diff_drive
import pickle
import socket
import sys
import base64
import time
import numpy as np

counter = 0
count = 0
biglist=[]


def callback1(img,vw):
    global counter
    global count
    global biglist
    global k
    # file_name=''
    # print(vw.v)        
    frame = pickle.loads(img.image)
    # frame = img.image
    # print(frame)
    #biglist = np.append(biglist,[frame,[vw.v, vw.w]])
    biglist.append([frame,[vw.v, vw.w]])
    
    counter += 1
    
    if (counter == 10):
        t1 = time.time()
        s = socket.socket()
        s.connect(("192.168.43.46",5000))
        
        s.sendall(pickle.dumps(biglist,protocol=2))
        s.close()
        t2 = time.time()
        print(t2-t1)
        counter = 0      
        biglist=[]
        count += 1
        # file_name = "/home/pi/dada/file_{}.txt".format(count)
        # f = open(file_name,"w+") 
        # f.write(str(biglist))
        # f.close()
            
def listener():
    rospy.init_node('sensors_data', anonymous=True)
    camera_data = message_filters.Subscriber('camera_topic', Camera)
    camera_vw = message_filters.Subscriber('keyboard_topic', Diff_drive)  
    syn_data1 = message_filters.TimeSynchronizer([camera_data, camera_vw], 10)
    # syn_data1 = message_filters.TimeSynchronizer([camera_data], 10)
    syn_data1.registerCallback(callback1)
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()