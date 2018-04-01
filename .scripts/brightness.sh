#!/bin/bash

let "cur = $(cat /sys/class/backlight/intel_backlight/brightness)" 
let "max = 4437"
per=$(bc -l <<< "$cur / $max * 100")
per="${per%.*}%"
echo $per
