#!/bin/bash

# get the device id of the touchpad 
    # SINK_ID="$(pactl list | grep -m 1 "FiiO" | cut -d\" -f2- | cut -f1 -d'"')"
    SINK_ID="alsa_output.usb-FiiO_FiiO_USB_DAC_K1-01.analog-stereo"
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
