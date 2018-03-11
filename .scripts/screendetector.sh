#!/bin/bash
TESTVAR="$(xrandr --listactivemonitors | grep HDMI)"
if [ "$TESTVAR" ]
    then
        ~/.scripts/dualscreen.sh
    else 
        ~/.scripts/singlescreen.sh
fi 
