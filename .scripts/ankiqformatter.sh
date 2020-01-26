#!/bin/bash

tmpq=.q.md
tmpa=.a.md

# open in vim to edit
vim $tmpq
vim $tmpa

# pandoc -> html -> rem newlines -> put into clipboard
qstr=$(cat $tmpq | pandoc -f markdown -t html | tr -d "\n")
astr=$(cat $tmpa | pandoc -f markdown -t html | tr -d "\n")

echo -e "String:\n\n$qstr;$astr\n" 

if [[ -n $1 ]]; then
    echo "$qstr;$astr" >> $1
    echo "above string should have been inserted into the file: $1"
else
    echo "$qstr;$astr" | xclip -i
    echo "above string should be in clipboard"
fi

echo ""
