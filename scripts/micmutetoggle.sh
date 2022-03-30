#!/bin/bash

# gets the current input name by finding the source which has an asterisk ahead
# of its index and getting it's name (asking for the next few lines, filtering
# them for 'name' and only taking the first and then filtering out the name).
get_current_input_name() {
  pacmd list-sources \
    | grep '* index' -A4  \
    | grep name \
    | head -n1 \
    | sed 's/\s*name: <\(.*\)>/\1/'
}

# the name of the device to be muted
devname="$(get_current_input_name)"

mutestatusfile='/home/ztf/scripts/.vars/mic'

# This statement simply checks whether the FIRST(!) source found is
# muted by checking whether the string contains the substring "yes"
# This is the quick-and-dirty solution and it relies on it being the
# first input device. If this is not the case, simply replug the
# higher-ranked devices until it is the first. (or improve the
# script i guess...)
if [[ "$(cat "${mutestatusfile}")" == *hot* ]]; then
  echo "mic was hot"
  # flash a short notification
  notify-send -t 1000 "mic muted" "device name: \'${devname}\'" &
  # play the unplug sound
  mpv /usr/share/sounds/freedesktop/stereo/device-removed.oga &
  pactl set-source-mute "${devname}" true
  echo "muted" > "${mutestatusfile}"
else
  # flash a short notification
  notify-send -t 1000 "mic hot" "device name: \'${devname}\'" &
  # play the unplug sound
  mpv /usr/share/sounds/freedesktop/stereo/device-added.oga &
  pactl set-source-mute "${devname}" false
  echo "hot" > "${mutestatusfile}"
fi
