#!/bin/bash

if [[ "$1" == "-h" ]]; then
  echo "a handler script for my work-time.sh script"
  echo "usage:"
  echo '  `work-time-manager.sh continue` to continue'
  echo '  `work-time-manager.sh pause` to pause'
  echo '  `work-time-manager.sh` without args only starts the process'
  echo ''
  exit 0
fi

if ps -e | grep -q 'work-time.sh'
then
  echo "process already exists"
else
  /home/ztf/.scripts/work-time.sh > /tmp/worktime.log &
  echo "process started"
  sleep 1
fi

pid="$(pgrep work-time.sh)"
echo "PID of script is $pid"

if [[ "$1" == "continue" ]]; then
  kill '-SIGUSR2' "$pid"
  notify-send "mgr: continued"
elif [[ "$1" == "pause" ]]; then
  kill '-SIGUSR1' "$pid"
  notify-send "mgr: paused"
elif [[ "$1" == "" ]]; then
  echo "no args given, simply ensured process is running"
else
  echo "unknown command"
  exit -1
fi
