#!/bin/bash 

link="$1"
file='/home/ztf/.tempvid.mp4' 

rm "$file"
youtube-dl --format=22 "$link" -o "$file"
mpv --volume=25 "$file"
