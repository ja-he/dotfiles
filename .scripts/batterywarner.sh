#!/bin/bash

while (true); do 
    # wait 60 seconds 
    sleep 60
    # get battery percentage as a single number
    original_output=$(acpi)
    dropped_clutter_prefix=${original_output#*,}
    dropped_clutter_suffix=${dropped_clutter_prefix%'%'*}
    # this now holds the iE "24" if battery is 24% charged
    percentage_digits=$dropped_clutter_suffix
    # if the battery percentage is below 5%, put up a warning
    if (( $percentage_digits <= 5 )); then 
        i3-nagbar -t WARNING -m "CHARGE YOUR LAPTOP, DUMMY!"
    fi 
done 
