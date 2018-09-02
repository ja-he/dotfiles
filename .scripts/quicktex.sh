#!/bin/bash 

if [ -z "$1" ]; then 
    echo "please pass latex" 
    exit 1
fi 

if [ "$1"="-h" ]; then 
    echo "syntax: " 
    echo ".scripts/quicktex.sh path/to/latex_code_file.tex output/path/imgname"
    break 1
fi 

if [ "$1"="-c" ]; then 
    vim ~/.scripts/quicktexfiles/content.tex
    CONTENT=~/.scripts/quicktexfiles/content.tex
    DEFAULT_FILE_USED=true
else 
    CONTENT="$1"
    DEFAULT_FILE_USED=false
fi 

if [ -z "$2" ]; then 
    echo "please pass output file"
    exit 1
else 
    IMAGE="$2.png"
fi 

# rendering 
cat ~/.scripts/quicktexfiles/pre.tex $CONTENT ~/.scripts/quicktexfiles/post.tex | pdflatex -output-directory ~
convert -density 1920 ~/texput.pdf -quality 90 "$IMAGE"

# previewing 
feh "$IMAGE" -B white -.

# cleanup 
rm ~/texput.*
if [ $DEFAULT_FILE_USED = true ]; then 
    rm ~/.scripts/quicktexfiles/content.*
fi 
