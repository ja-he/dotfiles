#!/bin/sh

if [ $1 ]; then 
    STREAM=$1
else 
    echo "you need to pass a streamname to open."
    echo "Syntax: ./twitch.sh <streamname> [<quality option>]"
    exit 1
fi 

if [ $2 ]; then 
    QUALITY=$2
else 
    QUALITY="best"
fi 

chromium-browser --app=https://www.twitch.tv/$STREAM/chat?popout= > /dev/null & 
streamlink -p "mpv" twitch.tv/$STREAM $QUALITY

