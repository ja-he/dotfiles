#!/bin/bash

print_help_and_exit() {
  echo "a small bash script to set wacom features to an output"
  echo "('feature' here means for example the stylus feature)"
  echo ""
  echo "Usage:"
  echo "  <script> <feature_name | 'all'> <output_name>"
  echo "Examples:"
  echo "  $ ./wacom-to-output.sh stylus LVDS-1"
  echo "  $ ./wacom-to-output.sh all VGA1"
  echo ""
  exit 0
}

find_wacom_id() {
  search_str="$(xsetwacom --list devices | grep -i $1)" 
  without_prefix="${search_str##*'id: '}" # drop prefix 
  without_suffix="${without_prefix%\t*}" # drop suffix 
  id=$(echo $without_suffix | tr -d ' ')
  echo $id
}

set_to_output() {
  device="$1"
  output="$2"
  device_id=$( find_wacom_id ${device} )
  echo "found wacom id \"$device_id\" for device clue \"$device\""
  echo "setting device \"$device\" to output \"$output\"..."
  xsetwacom --set $device_id MapToOutput $output
}

if [[ $# < 2 ]]; then
  print_help_and_exit
fi

if [[ $1 == 'all' ]]; then 
  set_to_output 'stylus' $2
  set_to_output 'eraser' $2
else
  set_to_output $1 $2
fi
