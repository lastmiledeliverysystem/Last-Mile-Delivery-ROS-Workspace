#!/usr/bin/python3
import rospy
from sensors_pkg.msg import Camera
from control_pkg.msg import Diff_drive
import socket
import pickle
from time import sleep,time

pub = rospy.Publisher('auto_topic', Diff_drive , queue_size=50) 
msg= Diff_drive()

v= 0
w= 0


def callback(data):
    global v,w
    t1= time()
    # frame =(pickle.loads(data.image))
    frame=data.image
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(("192.168.43.98",4000))
    s2= socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    print("Sending Image")
    # s.sendall(pickle.dumps(frame))
    s.sendall(frame)
    s.close()
    s2.connect(("192.168.43.98",4000))
    s2.send(b'D')
    action= s2.recv(1024)
    action= pickle.loads(action)
    print(action)
    s.close() 
    s2.close()

    v= action[1]
    w= action[0]
    msg.v=v
    msg.w=w
    pub.publish(msg)
    t2=time()
    print(t2-t1)
    # rospy.loginfo(msg)

def listener():
    global v,w
    rospy.init_node('socket_node', anonymous=True)
    rospy.Subscriber('camera_topic', Camera, callback)
  
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()
   
    

if __name__ == '__main__':
    listener()
