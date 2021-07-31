#!/bin/bash

i3lock \
    -c 000000
   #-i ~/bitmap.png \
   #--insidecolor=ff0000ff \
   #--insidevercolor=ff0000ff \
   #--insidewrongcolor=ff0000ff \
   #--ringcolor=ffff00ff \
   #--ringvercolor=ffffffff \
   #--ringwrongcolor=ffffffff \
   #--linecolor=ff0000ff \
   #--separatorcolor=ff0000ff \
   #--keyhlcolor=ffffffff \
   #--bshlcolor=ffffffff \
   #--verifcolor=ffffffff \
   #--wrongcolor=ffffffff \
   #--indpos="w-120:h-120" \
   #--verif-font="NimbusSans-Bold" \
   #--wrong-font="NimbusSans-Bold" 

sleep 5

systemctl suspend
