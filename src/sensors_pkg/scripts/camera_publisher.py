#!/usr/bin/env python3
import rospy
import cv2
import pickle
from sensors_pkg.msg import Camera 
import std_msgs.msg
 


def camera_capture():   
    video = cv2.VideoCapture(0)
    video.set(3,800) #horizontal pixels
    video.set(4,600) ##vertical pixels
   
    check, frame = video.read()    
   
    video.release()
    # cv2.destroyAllWindows()
    return frame

def camera_node():
    pub = rospy.Publisher('camera_topic', Camera , queue_size=50)
    
    rospy.init_node('camera_node', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    msg = Camera()
    # msg.header.stamp=rospy.Time.now()
    while not rospy.is_shutdown():
        #msg.image = camera_capture()
        frame = camera_capture()
        frame = frame[:510][115:]
        frame = cv2.resize(frame,(200,88))
        # cv2.imshow('image',frame)
        # cv2.waitKey(0)
        # cv2.destroyAllWindows()
        msg.image = pickle.dumps(frame,protocol=2)
        #frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB) 
        cv2.imwrite('/home/pi/catkin_gp/image.jpg',frame)
        # rospy.loginfo(msg)
        pub.publish(msg)
        rate.sleep()

if __name__ == '__main__':
    try:
        print("started")
        camera_node()
    except rospy.ROSInterruptException:
        pass
