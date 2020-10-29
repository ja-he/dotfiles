#!/bin/bash


function print_help() {
  echo "either:     $ .script/ankiqformatter -h"
  echo "or:         $ .script/ankiqformatter"
  echo "or:         $ .script/ankiqformatter <outputfile>"
  echo "or:         $ .script/ankiqformatter -c <outputfile>"
}

if [[ $1 == '-h' ]]; then
  print_help
  exit 0
fi


if [[ $1 == '-c' ]]; then 
  ofile="$2"
  nvim .c.md
  cstr=$(cat .c.md | pandoc -f markdown -t html --mathjax | tr -d "\n")
  echo "${cstr}" > .c.html
  nvim +"set tw=0" .c.html
  cat .c.html >> "${ofile}"
  exit 0
fi


tmpq=.q.md
tmpa=.a.md

# open in nvim to edit
nvim $tmpq
nvim $tmpa

# pandoc -> html -> rem newlines -> put into clipboard
qstr=$(cat $tmpq | pandoc -f markdown -t html --mathjax | tr -d "\n")
astr=$(cat $tmpa | pandoc -f markdown -t html --mathjax | tr -d "\n")

sep='·' # this is altgr+comma

echo -e "String:\n\n$qstr$sep$astr\n" 

if [[ -n $1 ]]; then
    echo "$qstr$sep$astr" >> $1
    echo "above string should have been inserted into the file: $1"
else
    echo "$qstr$sep$astr" | xclip -i
    echo "above string should be in clipboard"
fi

echo ""
