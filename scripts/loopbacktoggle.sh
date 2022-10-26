#!/bin/bash

_exit_because_monitor() {
    mpv /usr/share/sounds/freedesktop/stereo/dialog-error.oga > /dev/null &
    notify-send -t 1000 -u critical "default source is a monitor?"
    exit 1
}
pactl get-default-source | grep -i "monitor" && _exit_because_monitor

if pactl list | grep loopback; then
  pactl unload-module module-loopback
  notify-send -t 1000 "loopback off"
else 
  pactl load-module module-loopback
  notify-send -t 1000 "loopback on"
fi
