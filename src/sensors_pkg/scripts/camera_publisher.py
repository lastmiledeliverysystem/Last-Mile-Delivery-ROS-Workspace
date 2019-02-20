#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
# from std_msgs.msg import ColorRGBA
# from std_msgs.msg import Float32MultiArray
# from std_msgs.msg import Float64MultiArray
import cv2



def Camera():   
    video = cv2.VideoCapture(0)
    video.set(3,300) #horizontal pixels
    video.set(4,300) ##vertical pixels
    #cvSetCaptureProperty(capture, CV_CAP_PROP_FRAME_WIDTH, 640)
    #cvSetCaptureProperty(capture, CV_CAP_PROP_FRAME_HEIGHT, 480)
    # while True:
    check, frame = video.read()
    #print(check) #return true if the img read successfully
    #ssprint(str(frame)) #represent rgb values and the picture window
    
    #print(frame)   ##########################
    
    #cv2.imshow("Capturing",frame)
    
    # key = cv2.waitKey(1)
    # if key== ord('q'):
    #     break

    video.release()
    cv2.destroyAllWindows()
    return str(frame)

def camera_node():
    pub = rospy.Publisher('camera_topic', String, queue_size=50)
    
    #pub = rospy.Publisher('camera_topic', ColorRGBA, queue_size=50) ########################
    
    rospy.init_node('camera_node', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
        value = Camera()
        #hello_str = "hello world %s" % rospy.get_time()
        rospy.loginfo("vlue:"+value)
        pub.publish(value)
        rate.sleep()

if __name__ == '__main__':
    try:
        print("started")
        camera_node()
    except rospy.ROSInterruptException:
        pass
