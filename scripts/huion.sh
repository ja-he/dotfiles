#!/bin/bash

print_help() {
  echo "a script to map the Huion Kamvas 13 (2020) pen tablet input to its display (sway/Wayland)"
  echo "|"
  echo "| usage:"
  echo "|   ./huion.sh <command>"
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

outputs=$(swaymsg -t get_outputs)

# Find the Kamvas by its description
huion_monitor=$(echo "$outputs" | jq -r '.[] | select(.make == "HAT" and (.model | test("Kamvas"))) | .name')
if [ -z "$huion_monitor" ]; then
  echo "error: Huion Kamvas not found in sway outputs"
  exit 1
fi
echo "huion output: '$huion_monitor'"

# Main monitor is the first non-Huion, non-laptop active output (fall back to any non-Huion)
main_monitor=$(echo "$outputs" | jq -r "[.[] | select(.name != \"$huion_monitor\" and .active)] | first | .name")
if [ -z "$main_monitor" ] || [ "$main_monitor" == "null" ]; then
  echo "error: no other active output found"
  exit 1
fi
echo "main output: '$main_monitor'"

# Get the main monitor's height for positioning in dual mode
main_height=$(echo "$outputs" | jq -r ".[] | select(.name==\"$main_monitor\") | .current_mode.height")

if   [ "$1" == "landscape" ]; then
  swaymsg output "$huion_monitor" enable mode 1920x1080 transform normal
elif [ "$1" == "dual" ]; then
  swaymsg output "$main_monitor"  enable mode 1920x1080 transform normal pos 0 0
  swaymsg output "$huion_monitor" enable mode 1920x1080 transform normal pos 0 "${main_height:-1080}"
elif [ "$1" == "mirror" ]; then
  swaymsg output "$huion_monitor" enable mode 1920x1080 transform normal pos 0 0
  swaymsg output "$main_monitor"  pos 0 0
elif [ "$1" == "portrait" ]; then
  swaymsg output "$huion_monitor" enable mode 1920x1080 transform 90
elif [ "$1" == "portrait_flipped" ]; then
  swaymsg output "$huion_monitor" enable mode 1920x1080 transform 270
elif [ "$1" == "tablet" ]; then
  swaymsg output "$huion_monitor" disable
  swaymsg input type:tablet_tool map_to_output "$main_monitor"
  echo "tablet mapped to '$main_monitor'"
  exit 0
elif [ "$1" == "off" ]; then
  swaymsg output "$huion_monitor" disable
  exit 0
else
  echo "error: unknown command \"$1\""
  print_help
  exit 1
fi

swaymsg input type:tablet_tool map_to_output "$huion_monitor"
echo "tablet mapped to '$huion_monitor'"
exit 0
