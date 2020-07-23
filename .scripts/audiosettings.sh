#!/bin/bash

# get the device id of the touchpad 
# SINK_ID="$(pactl list | grep -m 1 "FiiO" | cut -d\" -f2- | cut -f1 -d'"')"
searchterm="FiiO"
SINK_ID="$(pactl list | grep ${searchterm} | grep Name | head -n 1)"
SINK_ID="${SINK_ID#*:}"
echo $SINK_ID

for i in "$@"; do
  case $i in 
    -v=*|--volume=*)
        pactl set-sink-volume $SINK_ID "${i#*=}%"
        ;;
    -i|--increase) 
        pactl set-sink-volume $SINK_ID +5%
        ;;
    -d|--decrease) 
        pactl set-sink-volume $SINK_ID -5%
        ;;
    -t|--toggle)
        pactl set-sink-mute $SINK_ID toggle
        ;;
    -m|--mute)
        pactl set-sink-mute $SINK_ID 1
        ;;
  esac 
done 
