if [ -z $1 ]; then 
    echo "no arguments provided :("
    exit 
elif [ $1 == "max" ]; then
    echo "setting brightness to maximum :)"
    cat /sys/class/backlight/intel_backlight/max_brightness > /sys/class/backlight/intel_backlight/brightness
fi
