#!/bin/bash


function print_help {
    echo "USAGE:    turn [off],                 " 
    echo "          turn [on],                  " 
    echo "          [initialize] to defaults,   " 
    echo "          get [help]                  "
}

if [ -z $1 ]; then 
    echo "PLEASE ENTER AN ACTION:"  
    print_help
    exit 
fi 

if [ "$1" = "help" ]; then 
    print_help
    exit 
fi 

# get the device id of the touchpad 
TOUCHPAD_ID="$(xinput --list | grep Synaptics | grep -oP 'id=\K.*?(?=\s)')"
echo "found touchpad ID: $TOUCHPAD_ID"


if [ "$1" = "off" ]; then 
    xinput set-prop $TOUCHPAD_ID "Device Enabled" 0
    echo "turned off :)"
    exit
fi 

if [ "$1" = "on" ]; then 
    xinput set-prop $TOUCHPAD_ID "Device Enabled" 1
    echo "turned on :)"
    exit
fi 

if [ "$1" = "initialize" ]; then 
    xinput set-prop $TOUCHPAD_ID "Device Enabled" 1

    # turn tap-to-click off
    #xinput set-prop $TOUCHPAD_ID 293 0 
    xinput set-prop $TOUCHPAD_ID "Synaptics Tap Action" 0 

    # turn acceleration off 
    #xinput set-prop $TOUCHPAD_ID 273 0 
    xinput set-prop $TOUCHPAD_ID "Device Accel Profile" 0 

    # set two-finger-scrolling to vertical only 
    #xinput set-prop $TOUCHPAD_ID 288 1 0 
    xinput set-prop $TOUCHPAD_ID "Synaptics Two-Finger Scrolling" 1 0

    # set edge-scrolling to horizontal only 
    #xinput set-prop $TOUCHPAD_ID 287 0 1 0 
    xinput set-prop $TOUCHPAD_ID "Synaptics Edge Scrolling" 0 1 0 
    echo "initialized :)"
    exit
fi 
