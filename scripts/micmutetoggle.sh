#!/bin/bash
_exit_because_monitor() {
    mpv /usr/share/sounds/freedesktop/stereo/dialog-error.oga > /dev/null &
    notify-send -t 1000 -u critical "default source is a monitor?"
    exit 1
}

pactl get-default-source | grep -i "monitor" && _exit_because_monitor

pactl set-source-mute @DEFAULT_SOURCE@ toggle
muted="$(pactl get-source-mute @DEFAULT_SOURCE@ | sed 's/Mute:\s*\(\S*\)$/\1/')"
message="$(echo "${muted}" | sed 's/yes/mic muted/' | sed 's/no/mic hot/')"
if [ "${muted}" == "no" ]; then
  mpv /usr/share/sounds/freedesktop/stereo/device-added.oga &
  notify-send -t 1000 -u critical "${message}"
else
  mpv /usr/share/sounds/freedesktop/stereo/device-removed.oga &
  notify-send -t 1000             "${message}"
fi
