powered="$(bluetoothctl show | grep 'Powered' | grep 'yes')"
connect=true
device_id="4C:87:5D:0A:68:6C"

if [[ "${powered}" ]]
then
  bluetoothctl power off
else
  bluetoothctl power on
  if [[ connect ]]
  then
    bluetoothctl connect ${device_id}
    sleep 3
    bluetoothctl connect ${device_id}
  fi
fi
