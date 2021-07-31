#!/bin/bash

tmpsrc=.tmp.md

# open in vim to edit
vim $tmpsrc

# pandoc -> html -> rem newlines -> put into clipboard
pandoc -f markdown -t html $tmpsrc | tr -d "\n" | xclip -i

echo "your html oneliner should be in your clipboard"
