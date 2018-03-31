#!/bin/bash

# checking for help prompt
if [ "$1" == "-h" ]; then 
    echo -e "\t\tUsage: \$ customres.sh <width> <height>"
    echo -e "\t\ti.E.:  \$ customres.sh  800     450"
fi 

# checking for existance of parameters 
if [ -z $1 ]; then 
    exit 1
fi 
if [ -z $2 ]; then 
    exit 1
fi

# generating the modeline 
MODELINE=$(cvt $1 $2 60)
MODELINE=$(echo -n '"'${MODELINE#*\"})

# creating the mode
xrandr --newmode $MODELINE
RESNAME=${MODELINE%% *}

# adding the mode to the display's modes
xrandr --addmode LVDS-1 $RESNAME 

# changing to the custom resolution 
xrandr --output LVDS-1 --mode $RESNAME
