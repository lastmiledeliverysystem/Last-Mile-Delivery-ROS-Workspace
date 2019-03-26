#!/usr/bin/python3.5
import rospy
from control_pkg.msg import Diff_drive
from pynput import keyboard
import getch
from time import sleep
import math
import spidev
vCounter = 0
wCounter = 0
inc = 1 
v= 0
w= 0

def vFnc(x):
    return 79.7 *( ( 2 / ( 1 + math.exp(-.3*x) ) ) -1 ) 

def wFnc(x):
    return 63.76 *( ( 2 / ( 1 + math.exp(-.3*x) ) ) -1 ) 


def on_release(key):
    global vCounter,wCounter
    if key.char == 'd':
        print("Here")
        wCounter = 0
    if key.char =='a':
        wCounter = 0

    print(vCounter,wCounter)
    
    if key == keyboard.Key.esc:
        # Stop listener
        return False

def talker():
    global v, w,vCounter,wCounter
    pub = rospy.Publisher('keyboard_topic', Diff_drive, queue_size=10)
    rospy.init_node('keyboard_node', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    msg = Diff_drive()

    with keyboard.Listener(on_release=on_release) as listener:
        
        while not rospy.is_shutdown():  
            # print('{0} pressed'.format(key))
            # print(vCounter, v)
            # print(wCounter, w)
            keyPress = getch.getch()
            print(keyPress)
            if keyPress == 'w':
                print("forward")
                vCounter += inc
            if keyPress == 's':
                print("backward")
                vCounter -= inc        
            if keyPress == 'd':
                wCounter += inc
            if keyPress == 'a':
                wCounter -= inc
            if keyPress == ' ':
                vCounter = 0
                wCounter = 0
            if keyPress == 'r':
                vCounter *= -1
            
            print(vCounter, wCounter)
            v =  vFnc( vCounter )
            w =  wFnc( wCounter )
            msg.v = v
            msg.w = w

            # rospy.loginfo(msg)
            pub.publish(msg)
            rate.sleep()
        listener.join()


if __name__ == '__main__':
    try:
        talker()        
    except rospy.ROSInterruptException:
        pass
