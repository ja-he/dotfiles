#!/bin/bash

wait_time=1
start_time=800
end_time=2000

# prints the current state
function print_state() {
  echo "state:"
  echo "  timepath : ${timepath}"
  echo "  timefile : ${timefile}"
  echo "  running  : ${running}"
  echo "  warned   : ${warned}"
  echo "  day      : ${day}"
  echo "  time     : ${timestr}"
  echo "  worktime : ${worktime}"
}




echo "worktime script started"

timepath="/home/ztf/.worktime"
running=true
warned=false
worktime=0

trap 'notify-send "work-time paused"; running=false' SIGUSR1
trap 'notify-send "work-time continued"; running=true' SIGUSR2

echo "signal handlers registered"

day="$(date +%Y-%m-%d)"
timefile="${timepath}/${day}.timelog"

echo "day retrieved: $day"

# get time
timestr="$(date +%H%M)"
timestr=${timestr#0*} # trim leading 0s

echo "time retrieved: $timestr"

echo "setup done"
echo "initial state:"
print_state

# if the file exists and it's work time when we start, reload work time from
# the file
if [[ -e $timefile ]]; then # file exists
  echo "time file for today exists"
  if [[ ${timestr} -lt $end_time ]]; then # before 8PM
    echo "it's before $end_time"
    if [[ ${timestr} -gt  $start_time ]]; then # after 8AM
      echo "it's after $end_time"
      worktime=$(cat ${timefile})
      echo "worktime has been set to ${worktime} from file"
    fi
  fi
fi

echo "final state before loop:"
print_state

while true; do
  # sleep a bit
  sleep $wait_time

  echo "next iteration:"
  print_state

  # get time
  timestr="$(date +%H%M)"
  timestr=${timestr#0*} # trim leading 0s
  if [[ ${timestr} -ge 2330 ]]; then
    notify-send "Past 23:30, initiating evening routine" \
                "seriously, go to sleep soon :)"
    redshift -O 1400
    killall -q steam
    sleep 1790
    notify-send "shutting down..." "good night :)"
    sleep   10
    shutdown 0
  fi

  # if we were signaled to not run, then skip the checks
  if [[ "$running" == "false" ]]; then
    echo "not running"
    warned=false
    echo "disabled warning"
    # at 8AM turn on
    if [[ ${timestr} -eq $start_time ]]; then
      echo "it's $start_time so starting work time (at 0)"
      running=true
      warned=false
      worktime=0
    fi
    continue
  fi

  # if it's not work-time, then skip the checks
  if [[ ${timestr} -lt  $start_time ]]; then # before 8AM
    echo "before $start_time, skipping"
    worktime=0
    running=false
    continue
  fi
  if [[ ${timestr} -ge $end_time ]]; then # past 8PM
    echo "past $end_time, skipping"
    running=false
    continue
  fi

  illegal_running=false

  # if forbidden program is running, warn, wait a bit, kill it
  if ps -e | grep -q chromium; then illegal_running=true; fi
  if ps -e | grep -q steam; then illegal_running=true; fi

  if [[ "$illegal_running" == "true" ]]; then
    if [[ "$warned" == "true" ]]; then
      warned=false
      killall -q chromium
      killall -q steam
      notify-send "Killed illegal programs"
    else
      notify-send "Stay Working" \
                  "It's your work time, illegal programs will be killed in $wait_time seconds."
      warned=true
    fi
  fi

  worktime=$((worktime + $wait_time))
  echo $worktime > $timefile
done
