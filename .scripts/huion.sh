#!/bin/bash

get_huion_monitor() {
  # NOTE: assumes only one HDMI output connected (the Huion)
  #       because it takes the first connected HDMI monitor
  xrandr | grep ' connected' | grep HDMI | cut -d' ' -f1 | xargs
}

get_main_monitor() {
  # NOTE: assumes only exactly one more output connected (besides the Huion)
  #       because it takes the first connected non-HDMI monitor
  xrandr | grep ' connected' | grep -v HDMI | cut -d' ' -f1 | xargs
}

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
echo "found device '$dev'"

huion_monitor=$(get_huion_monitor)
echo "found huion output '$huion_monitor'"
main_monitor=$(get_main_monitor)
echo "found other output '$main_monitor'"

if   [ "$1" == "landscape" ]; then
  xrandr --output $huion_monitor --mode 1920x1080 --rotate normal
elif [ "$1" == "dual" ]; then
  xrandr --output $main_monitor  --mode 1920x1080 --rotate normal
  xrandr --output $huion_monitor --mode 1920x1080 --rotate normal --left-of $main_monitor
elif [ "$1" == "mirror" ]; then
  xrandr --output $huion_monitor --mode 1920x1080 --rotate normal
  xrandr --output $main_monitor  --same-as $huion_monitor
elif [ "$1" == "portrait" ]; then
  xrandr --output $huion_monitor --mode 1920x1080 --rotate left
elif [ "$1" == "tablet" ]; then
  xrandr --output $huion_monitor --off
elif [ "$1" == "off" ]; then
  xrandr --output $huion_monitor --off
  exit 0
else
  echo "error: unknown command \"$1\""
  print_help
  exit -1
fi

xinput map-to-output $dev $huion_monitor
exit 0
