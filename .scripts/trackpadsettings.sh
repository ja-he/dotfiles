#!/bin/bash

# get the device id of the touchpad 
    TOUCHPAD_ID="$(xinput --list | grep Synaptics | grep -oP 'id=\K.*?(?=\s)')"
    echo $TOUCHPAD_ID


# turn tap-to-click off
    #xinput set-prop $TOUCHPAD_ID 293 0 
    xinput set-prop $TOUCHPAD_ID "Synaptics Tap Action" 0 

# turn acceleration off 
    #xinput set-prop $TOUCHPAD_ID 273 0 
    xinput set-prop $TOUCHPAD_ID "Device Accel Profile" 0 

# set two-finger-scrolling to vertical only 
    #xinput set-prop $TOUCHPAD_ID 288 1 0 
    xinput set-prop 13 "Synaptics Two-Finger Scrolling" 1 0

# set edge-scrolling to horizontal only 
    #xinput set-prop $TOUCHPAD_ID 287 0 1 0 
    xinput set-prop $TOUCHPAD_ID "Synaptics Edge Scrolling" 0 1 0 
