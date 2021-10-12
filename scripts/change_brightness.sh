#!/bin/bash

set -euo pipefail

if xbacklight; then
  if [ $1 == "-" ]; then
    xbacklight - 10
  elif [ $1 == "+" ]; then
    xbacklight + 10
  else
    echo "ERROR NO ARG"
    exit 1
  fi
  exit 0
fi

file="/sys/class/backlight/intel_backlight/brightness"

now=`cat $file`

if [ $1 == "-" ]; then
  next=$(( $now - 100 ))
elif [ $1 == "+" ]; then
  next=$(( $now + 100 ))
else
  echo "ERROR NO ARG"
  exit 1
fi

next=$(( $next > 934 ? 934 : $next ))
next=$(( $next < 0 ? 0 : $next ))

echo "$next" > $file
echo "changed to $next"
