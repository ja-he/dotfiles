#!/bin/bash

print_help() {
  echo "a script to map the Huion Kamvas 13 (2020) pen tablet input to its display"
  echo "|"
  echo "| usage:"
  echo "|   ./huion.sh <command>"
  echo "| commands:"
  echo "|   landscape : map to pen display in landscape mode"
  echo "|   portrait  : map to pen display in portrait mode (buttons on top)"
  echo "|   tablet    : map to main display, use only as drawing tablet"
  echo "|   off       : turn off"
}

if [ -z $1 ]; then
  echo "error, no arg"
  print_help
  exit -1
fi

dev="$(xinput | grep "Tablet Monitor Pen Pen" | cut -f2 | cut -c4- | xargs)"
monitor=

if   [ "$1" == "landscape" ]; then
  monitor=HDMI1
  xrandr --output HDMI1 --mode 1920x1080 --rotate normal
elif [ "$1" == "portrait" ]; then
  monitor=HDMI1
  xrandr --output HDMI1 --mode 1920x1080 --rotate left
elif [ "$1" == "tablet" ]; then
  monitor=eDP1
  xrandr --output HDMI1 --off
elif [ "$1" == "off" ]; then
  xrandr --output HDMI1 --off
  exit 0
else
  echo "error: unknown command \"$1\""
  print_help
  exit -1
fi

xinput map-to-output $dev $monitor
exit 0
