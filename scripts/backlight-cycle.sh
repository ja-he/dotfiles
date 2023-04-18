#!/bin/bash

set -x


current=$(xbacklight -get)

next=$(( $current + 10))
if (( next > 100 )); then
  next=0
fi

xbacklight -set $next
