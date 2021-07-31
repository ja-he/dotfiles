#!/bin/bash

device_id="$(xinput | grep TrackPoint)"
device_id="${device_id#*id=}"
device_id="${device_id%[*}"

setting_id=$(xinput list-props $device_id | grep "Accel Speed (")
setting_id=${setting_id#*(}
setting_id=${setting_id%)*}

accel_setting="-1"

echo "dev:$device_id, set:$setting_id"

xinput set-prop $device_id $setting_id $accel_setting
