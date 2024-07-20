#!/bin/bash

set -x


current=$(xbacklight -get)

# can take args 'up' or 'down'
case $1 in
  up)
    next=$(( $current + 10))
    ;;
  down)
    next=$(( $current - 10))
    ;;
  *)
    echo "Usage: backlight-cycle.sh [up|down]"
    exit 1
    ;;
esac

# clamping
if (( next > 100 )); then
  next=100
fi
if (( next < 0 )); then
  next=0
fi

xbacklight -set $next
