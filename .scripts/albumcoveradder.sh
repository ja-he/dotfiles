#!/bin/bash 

# setting the cover variable to the given argument, should one have been
# provided or otherwise defaulting to the default name, as long as it exists
# should neither be the case, printing an error and exiting 
if [ $1 ]; then 
    cover="$1"
else 
    if [ -e cover.jpg ]; then 
        cover="cover.jpg"
    else 
        if [ -e cover.png ]; then 
            cover="cover.png"
        else 
            echo -ne    "ERROR: no cover image seems to exist under the assumed name (cover.png or .jpg),"
            echo -e     "nor has one been provided as an argument... please provide a cover image."
            exit 1
        fi 
    fi 
fi 

# looping through all .mp3-files in the current dir and assigning them each the
# cover image with ffmpeg. 
# the files are output with a suffix of .fixedcover.mp3 and then renamed to the
# original filename, as long as the conversion was successful (ie such an
# output file was actually produced. if any output file ever isn't we simply
# print an error, but continue. 
for song in *.mp3; do
	newsong="$song.fixedcover.mp3"
	ffmpeg -i "$song" -i "$cover" -map 0:0 -map 1:0 -c copy -id3v2_version 3 -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (front)" "$newsong";
    if [ -e "$newsong" ]; then 
        rm "$song"
        mv "$newsong" "$song"
    else 
        echo -e "ERROR: File $song was not converted successfully!"
    fi 
done
