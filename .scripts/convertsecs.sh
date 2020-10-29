#!/bin/bash

# script coped from perreal on stackoverflow:
# https://stackoverflow.com/questions/12199631/convert-seconds-to-hours-minutes-seconds

convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "%02d:%02d:%02d\n" $h $m $s
}

echo $(convertsecs $1)
