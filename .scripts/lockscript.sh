#!/bin/bash

sleep 1
scrot ~/.scripts/variables/.tempscr.png
convert ~/.scripts/variables/.tempscr.png -gaussian-blur 15x2 ~/.lockimgb.png
rm ~/.scripts/variables/.tempscr.png
i3lock -i ~/.lockimgb.png
