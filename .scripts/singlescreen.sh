#!/bin/sh
# xrandr 
xrandr --output HDMI1 --off --output DP1 --off --output eDP1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output VIRTUAL1 --off

# feh 
feh --bg-fill ~/.bgimg.png
