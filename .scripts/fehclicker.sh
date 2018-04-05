#!/bin/bash

BGOPT=""

while getopts ":b:" opt; do
    case $opt in
        b)
            if [ "$OPTARG" = "0" ]; then 
                BGOPT="-b "#000000""
            fi
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

for i in ./*.{jpg,jpeg,png}
do 
    echo -n "working... "
    feh --bg-fill $i 
    echo -n -e "\033[2K\r"
    echo -e             "displayed file:  \t[\033[0;31m$i\033[0m]"
    looper=true
    while [ "$looper" = true ]; do
        echo -n -e "\033[2K\r"
        read -p "press [n]ext, [f]avourite, [d]iscard or [e]xit > " -rsn1 input
        if [ "$input" = "f" ]; then 
            cp $i ./favs/
            echo -n -e "\033[2K\r"
            echo -e     "favourited file: \t[\033[0;31m$i\033[0m]"
        fi
        if [ "$input" = "d" ]; then 
            mv $i ./.toosmall
            echo -n -e "\033[2K\r"
            echo -e     "discarded file:  \t[\033[0;31m$i\033[0m]" 
        fi
        if [ "$input" = "n" ]; then 
            looper=false
        fi
        if [ "$input" = "e" ]; then 
            echo "exiting script... goodbye :)"
            exit 1
        fi
    done
done
echo "that was the last file :)"
