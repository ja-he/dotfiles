#!/bin/bash

print_help() {
  echo "a script to map the Huion Kamvas 13 (2020) pen tablet input to its display"
  echo "|"
  echo "| usage:"
  echo "|   ./huion.sh <command> <huion-mon> <main-mon>"
  echo "| commands:"
  echo "|   landscape        map to pen display in landscape mode"
  echo "|   dual             map to pen display in dual-screen mode"
  echo "|   mirror           map to pen display in mirrored mode"
  echo "|   portrait         map to pen display in portrait mode (buttons on top)"
  echo "|   portrait_flipped map to pen display in portrait mode (buttons on bottom)"
  echo "|   tablet           map to main display, use only as drawing tablet"
  echo "|   off              turn off"
}

if [ -z "$1" ]; then
  echo "error, no arg"
  print_help
  exit 1
fi

dev="$(xinput | grep "xwayland-tablet stylus:45" | cut -f2 | cut -c4- | xargs)"
echo "found device '$dev'"

huion_monitor="${2}"
echo "found huion output '$huion_monitor'"
main_monitor="${3}"
echo "found other output '$main_monitor'"

if   [ "$1" == "landscape" ]; then
  xrandr --output "$huion_monitor" --mode 1920x1080 --rotate normal
elif [ "$1" == "dual" ]; then
  xrandr --output "$main_monitor"  --mode 1920x1080 --rotate normal
  xrandr --output "$huion_monitor" --mode 1920x1080 --rotate normal --below "$main_monitor"
elif [ "$1" == "mirror" ]; then
  xrandr --output "$huion_monitor" --mode 1920x1080 --rotate normal
  xrandr --output "$main_monitor"  --same-as "$huion_monitor"
elif [ "$1" == "portrait" ]; then
  xrandr --output "$huion_monitor" --mode 1920x1080 --rotate left
elif [ "$1" == "portrait_flipped" ]; then
  xrandr --output "$huion_monitor" --mode 1920x1080 --rotate right
elif [ "$1" == "tablet" ]; then
  xrandr --output "$huion_monitor" --off
elif [ "$1" == "off" ]; then
  xrandr --output "$huion_monitor" --off
  exit 0
else
  echo "error: unknown command \"$1\""
  print_help
  exit 1
fi

xinput map-to-output "$dev" "$huion_monitor"
exit 0
