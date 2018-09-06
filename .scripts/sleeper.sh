#!/bin/bash 

while true; do 
    if [ "$(date +%H%M)" == "2100" ]; then 
        shutdown 4 
        // echo "shutting down in four minutes..." | festival --tts --pipe 
        mpv ~/Music/_conv/David\ Bowie\ -\ Life\ On\ Mars-v--IqqusnNQ.webm.mp3 --volume=60 
    else 
        echo -ne "date is: "
        date +%H%M
        sleep 60
    fi 
done 
