from pynput import keyboard
import getch
import sys

vCounter = 0
wCounter = 0
inc = 1 

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

# Collect events until released
while 1:
    with keyboard.Listener(on_release=on_release) as listener:

        keyPress = msvcrt.getch()
        if keyPress == b'w':
            vCounter += inc
        if keyPress == b's':
            vCounter -= inc        
        if keyPress == b'd':
            wCounter += inc
        if keyPress == b'a':
            wCounter -= inc
        if keyPress == b' ':
            vCounter = 0
            wCounter = 0
        if keyPress == b'r':
            vCounter *= -1
        
        print(vCounter, wCounter)
        

    listener.join()