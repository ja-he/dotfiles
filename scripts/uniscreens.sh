!#/bin/bash

read -p "press [s]ame to mirror, [d]ifferent to not mirror or [o]ff to turn off > " -rsn1 input
echo $input

if [ $input = "s" ]; then 
    xrandr --output VGA-1 --mode 1024x768 --same-as LVDS-1
    xrandr --output LVDS-1 --mode 1024x768 
elif [ $input = "d" ]; then 
    xrandr --output VGA-1  --mode 1024x768 --left-of LVDS-1  
    xrandr --output LVDS-1 --mode 1600x900  
else 
    xrandr --output VGA-1 --off 
    xrandr --output LVDS-1 --mode 1600x900
fi 
