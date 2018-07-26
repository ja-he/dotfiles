#!/bin/bash 

# the files are output with a suffix of .fixedcover.mp3 and then renamed to the original 
# filename, as long as the conversion was successful (ie such an output file was actually 
# produced. if any output file ever isn't we simply print an error, but continue. 
for song in *.flac; do
	newsong="${song%.flac}.mp3"
    ffmpeg -i "$song" -ab 320k -map_metadata 0 -id3v2_version 3 "$newsong"
    if [ -e "$newsong" ]; then 
        rm "$song"
    else 
        echo -e "ERROR: File $song was not converted successfully!"
    fi 
done
