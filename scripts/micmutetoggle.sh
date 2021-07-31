#!/bin/bash

# the name of the device to be muted
devname='alsa_input.usb-C-Media_Electronics_Inc._USB_Advanced_Audio_Device-00.iec958-stereo'

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
