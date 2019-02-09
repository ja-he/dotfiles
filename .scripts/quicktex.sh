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
    -k      keep the .tex-file 
EOF
}

edit_content() {
    vim "$tex_content_location"
}

compile_to_pdf() {
    cat "$pre" "$tex_content_location" "$post" | pdflatex
}

show_pdf() {
    zathura texput.pdf > /dev/null
}

clean_up_pdflatex_clutter() {
    rm texput.aux
    rm texput.log
    rm texput.pdf
}

clean_up() {
    clean_up_pdflatex_clutter
    if [ $keep_tex = false ]; then 
        rm $tex_content_location
    fi 
}

turn_pdf_to_png() {
    convert -density 1920 texput.pdf -quality 90 "$output_file_name.png"
}

#TODO: refactor so that the custom file is copied to content.tex and then just 
#       continue with content.tex as always. 
#       this should streamline the script somewhat.
#TODO: refactor the variable names to be more sensible and in tune with changes 

pre="/home/ztf/.scripts/quicktexfiles/pre.tex"
post="/home/ztf/.scripts/quicktexfiles/post.tex"

# what kind of rendered file will be saved
output_type=".png"
# what the saved files will be called
output_file_name="qtout"
# where the tex body is stored during runtime 
tex_content_location="content.tex"
# whether the tex source is to be kept
keep_tex=false

# whether math was passed inline 
inline_math_passed=false

# Handling options and arguments 
while getopts "hkpo:f:m:" opt; do
    case "$opt" in
    # show the help 
    h)  show_help
        exit 0
        ;;
    # save as a pdf instead of a png 
    p)  output_type=".pdf"
        ;;
    # save under a custom name
    o)  output_file_name="$OPTARG"
        ;;
    # specify a content file to use, instead of starting empty 
    f)  tex_content_location="$OPTARG"
        ;;
    # keep the tex body 
    k)  keep_tex=true
        tex_content_location="$output_file_name.tex"
        ;;
    # pass an equation inline 
    m)  inline_math_passed=true
        # write the passed math slightly formatted into the content file 
        echo '\[' > "$tex_content_location"
        echo "$OPTARG" >> "$tex_content_location"
        echo '\]' >> "$tex_content_location"
        ;;
    esac
done

# get the initial content from the user, unless they passed it as inline math 
if [ $inline_math_passed = false ]; then 
    edit_content
fi

# let the user continually tweak the content, until they are satisfied
# (recompiling after each edit)
input="q"
while [ $input != "n" ]; do 
    # pipe the cobbled together latex file into pdflatex 
    # (this produces a file called texput.pdf)
    compile_to_pdf
    show_pdf
    # ask the user, if they want to edit further and get their answer
    echo -ne "$(tput setaf 1)would you like to make further edits?\n"
    read -p " [ y / n ]   > " -rsn1 input
    echo "$input" 
    tput sgr0 
    if [ "$input" = "y" ]; then
        edit_content
    fi 
done

# if the user wants the pdf instead of the png, save it and exit
if [ "$output_type" = ".pdf" ]; then 
    cp texput.pdf "$output_file_name.pdf"
else # if the user wants a png
    turn_pdf_to_png
fi 

clean_up
exit 0
