#!/usr/bin/env python3
import rospy
import cv2
import pickle
from sensors_pkg.msg import Camera  


def camera_capture():   
    video = cv2.VideoCapture(0)
    video.set(3,150) #horizontal pixels
    video.set(4,150) ##vertical pixels
   
    check, frame = video.read()    
   
    video.release()
    # cv2.destroyAllWindows()
    return frame

def camera_node():
    pub = rospy.Publisher('camera_topic', Camera , queue_size=50)
    
    
    rospy.init_node('camera_node', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    msg = Camera()

    while not rospy.is_shutdown():
        #msg.image = camera_capture()
        frame = camera_capture()
        msg.image = pickle.dumps(frame)
        #frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB) 

        rospy.loginfo(msg)
        pub.publish(msg)
        rate.sleep()

if __name__ == '__main__':
    try:
        print("started")
        camera_node()
    except rospy.ROSInterruptException:
        pass
