#!/bin/bash

#warned=false
#while (true); do 
#
#    # wait 60 seconds 
#    sleep 60
#
#    # get battery percentage as a single number
#    original_output=$(acpi)
#    dropped_clutter_prefix=${original_output#*,}
#    dropped_clutter_suffix=${dropped_clutter_prefix%'%'*}
#
#    # this now holds the iE "24" if battery is 24% charged
#    percentage_digits=$dropped_clutter_suffix
#
#    # current battery level printout 
#    echo "current battery level: $percentage_digits%"
#
#    # if the battery percentage is at 2% or less and the user has already been 
#    # warned, then suspend the machine to prevent loss of power.
#    if (( $percentage_digits <= 2 )); then 
#        if $warned; then 
#            warned=false
#            systemctl-suspend
#        fi
#    fi 
#
#    # if the battery percentage is below 5%, put up a warning
#    if (( $percentage_digits <= 5 )); then 
#        notify-send "Your battery is almost empty." \
#            "The battery is at $percentage_digits%, so you should charge it. :)" \
#            --urgency=critical \
#            --icon=/usr/share/icons/Numix/48/notifications/notification-battery-low.svg
#        warned=true
#    fi 
#
#done 
