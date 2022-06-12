#!/bin/bash
pulseaudio-ctl mute-input
muted="$(pulseaudio-ctl full-status | cut -f3 -d' ')"
message="$(echo "${muted}" | sed 's/yes/mic muted/' | sed 's/no/mic hot/')"
if [ "${muted}" == "no" ]; then
  mpv /usr/share/sounds/freedesktop/stereo/device-added.oga &
  notify-send -t 1000 -u critical "${message}"
else
  mpv /usr/share/sounds/freedesktop/stereo/device-removed.oga &
  notify-send -t 1000             "${message}"
fi
