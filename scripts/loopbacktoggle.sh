#!/bin/bash

varfile='/home/ztf/scripts/.vars/lbt'

if [[ $(cat "${varfile}") == *on* ]]; then
  echo -n 'off' > "${varfile}"
  pacmd unload-module module-loopback
  notify-send -t 1000 "loopback off"
else 
  echo -n 'on' > "${varfile}"
  pacmd load-module module-loopback
  notify-send -t 1000 "loopback on"
fi
