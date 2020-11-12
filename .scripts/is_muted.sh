#!/bin/bash

micstate="$(cat /home/ztf/.scripts/.vars/mic)"
icon=""
state=""
icon=""
if [[ "${micstate}" == "muted" ]]; then
  state="Good"
  icon=""
elif [[ "${micstate}" == "hot" ]]; then
  state="Critical"
  icon=""
else
  state="Warning"
  icon=""
fi

# for some reason i can't get $icon to work as the actual icon in the JSON even
# trying different font awesome versions...
echo "{\"icon\": \"\", \"state\": \"${state}\", \"text\": \" ${icon}\"}"
