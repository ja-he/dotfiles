#!/bin/bash 

while true; do 
    if [ "$(date +%H%M)" == "2100" ]; then 
        mpv ~/Music/_conv/David\ Bowie\ -\ Life\ On\ Mars-v--IqqusnNQ.webm.mp3 --volume=30
        shutdown 4 
        echo "shutting down in 4 minutes..."
        break
    else 
        echo -ne "date is: "
        date +%H%M
        sleep 60
    fi 
done 
