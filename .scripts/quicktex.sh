#!/bin/bash 

show_help() {
    cat << EOF 
USAGE: quicktex path/to/outputfilename [-h] [-p] [-f path/to/texfile.tex] 
                                        [-o path/to/outputfile]

    (pass the outputfilename without the .png or .pdf extension)

    -h      show this help 
    -p      save the PDF instead of the PNG
    -f      specify a custom tex-file to use, rather than writing on the spot 
            pass the file's location
    -o      specify the location of the output file, pass the location
    -m      quick inline math 
EOF
}

outputtype=".png"
outputfile="/home/ztf/quicktex_output"
content=~/.scripts/quicktexfiles/content.tex
default_content_location_used=true
inline_math_passed=false
passed_math=""

while getopts "hpo:f:m:" opt; do
    case "$opt" in
    h)  show_help
        exit 0
        ;;
    p)  outputtype=".pdf"
        ;;
    o)  outputfile="$OPTARG"
        ;;
    f)  content="$OPTARG"
        default_content_location_used=false
        ;;
    m)  inline_math_passed=true
        default_content_location_used=false
        passed_math="$OPTARG"
        ;;
    esac
done

if [ $default_content_location_used = true ]; then 
    vim ~/.scripts/quicktexfiles/content.tex
elif [ $inline_math_passed = true ]; then 
    echo -n "\$\$$passed_math\$\$" > /home/ztf/.scripts/quicktexfiles/content.tex
    default_content_location_used=true
fi 

input="q"; 
while [ $input != "y" ]; do 
    cat ~/.scripts/quicktexfiles/pre.tex $content ~/.scripts/quicktexfiles/post.tex | pdflatex -output-directory ~
    zathura ~/texput.pdf > /dev/null 
    echo -ne "$(tput setaf 1)were you satisfied with the appearance?\n"
    read -p " [y]es or [n]o ? > " -rsn1 input 
    echo "$input"
    tput sgr0
    if [ "$input" = "n" ]; then 
        vim ~/.scripts/quicktexfiles/content.tex 
    fi 
done 

if [ $outputtype = ".png" ]; then 
    convert -density 1920 ~/texput.pdf -quality 90 "$outputfile.png"
    feh "$outputfile.png" -B white -.
else 
    cp ~/texput.pdf "$outputfile.pdf"
    zathura "$outputfile.pdf"
fi 
echo -e "$(tput setaf 1)your file should be saved to $outputfile$outputtype"
tput sgr0

# cleanup 
#rm ~/texput.*
if [ $default_content_location_used = true ]; then 
    rm ~/.scripts/quicktexfiles/content.*
fi 
