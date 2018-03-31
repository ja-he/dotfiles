#!/bin/bash

if [ -z $1 ]; then 
    exit 1
fi 
if [ -z $2 ]; then 
    exit 1
fi

MODELINE=$(cvt $1 $2 60)
MODELINE=$(echo -n '"'${MODELINE#*\"})
xrandr --newmode $MODELINE
RESNAME=${MODELINE%% *}
xrandr --addmode LVDS-1 $RESNAME 
xrandr --output LVDS-1 --mode $RESNAME
