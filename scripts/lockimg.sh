#!/bin/bash

sleep 1
scrot ~/scripts/variables/shot.png
convert -scale 10% ~/scripts/variables/shot.png -scale 1000% ~/scripts/variables/pixl.png
rm ~/scripts/variables/shot.png
i3lock -i ~/scripts/variables/pixl.png
