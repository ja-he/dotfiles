#!/bin/bash

if [ "$(xrandr | grep VGA | grep " connected")" ]; then 
    ~/.scripts/dualscreen.sh
else 
    ~/.scripts/singlescreen.sh
fi
