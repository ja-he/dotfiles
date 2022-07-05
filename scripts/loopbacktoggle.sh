#!/bin/bash

varfile="${HOME}/.vars/lbt"

_exit_because_monitor() {
    mpv /usr/share/sounds/freedesktop/stereo/dialog-error.oga > /dev/null &
    notify-send -t 1000 -u critical "default source is a monitor?"
    exit 1
}
pactl get-default-source | grep -i "monitor" && _exit_because_monitor

if [[ $(cat "${varfile}") == *on* ]]; then
  echo -n 'off' > "${varfile}"
  pacmd unload-module module-loopback
  notify-send -t 1000 "loopback off"
else 
  echo -n 'on' > "${varfile}"
  pacmd load-module module-loopback
  notify-send -t 1000 "loopback on"
fi
