#!/bin/bash

output=$(cat variables/output.txt)
resolution=$(cat variables/res.txt)
rate=$(cat variables/rate.txt)

xrandr --output $output --mode $resolution --rate $rate
