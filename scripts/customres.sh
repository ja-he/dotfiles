#!/bin/bash

# checking for help prompt
if [ "$1" == "-h" ]; then 
    echo -e "\t\tUsage: \$ customres.sh <monitor>   <width> <height>"
    echo -e "\t\ti.E.:  \$ customres.sh LVDS-1      800     450"
    exit 0 
fi 

monitor="$1"
if [ -z $1 ]; then 
    echo "you didnt enter a monitor"
    exit 1
fi

# checking for existance of parameters 
if [ -z $2 ]; then 
    echo "you didnt enter a width"
    exit 1
fi 
if [ -z $3 ]; then 
    echo "you didnt enter a width"
    exit 1
fi

# generating the modeline 
MODELINE=$(cvt $2 $3 60)
MODELINE=$(echo -n '"'${MODELINE#*\"})

# creating the mode
xrandr --newmode $MODELINE
RESNAME=${MODELINE%% *}

# adding the mode to the display's modes
xrandr --addmode $monitor $RESNAME 

# changing to the custom resolution 
xrandr --output $monitor --mode $RESNAME
