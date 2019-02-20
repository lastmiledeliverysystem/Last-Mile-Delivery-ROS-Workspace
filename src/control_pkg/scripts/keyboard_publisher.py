#!/usr/bin/python3.5
import rospy
from control_pkg.msg import Diff_drive
from pynput.keyboard import Key, Listener
from time import sleep
import math
import spidev

vCounter = 0
wCounter = 0
v = 0
w = 0

def vFnc(x):
    return 111*( ( 2 / ( 1+math.exp(-.05*x) ) ) -1 ) 

def wFnc(x):
    return 111*( ( 2 / ( 1+math.exp(-.05*x) ) ) -1 ) 

def on_press(key):
        global vCounter, wCounter,v,w

        if key == key.up and vFnc(vCounter) <= 110:
            vCounter += 1
        elif key == key.down and vFnc(vCounter) >= -110:
            vCounter -= 1
        elif key == key.right and wFnc(vCounter) <= 109:
            wCounter += 1
        elif key == key.left and wFnc(vCounter) >= -109:
            wCounter -= 1

        v =  vFnc( vCounter )
        w =  wFnc( wCounter )

def talker():
    global v, w
    pub = rospy.Publisher('keyboard_topic', Diff_drive, queue_size=10)
    rospy.init_node('keyboard_node', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    msg = Diff_drive()

    with Listener(on_press=on_press) as listener:
        

        while not rospy.is_shutdown():  
        # print('{0} pressed'.format(key))
        # print(vCounter, v)
        # print(wCounter, w)
            msg.v = v
            msg.w = w

            rospy.loginfo(msg)
            pub.publish(msg)
            rate.sleep()
        listener.join()


if __name__ == '__main__':
    try:
        talker()        
    except rospy.ROSInterruptException:
        pass
