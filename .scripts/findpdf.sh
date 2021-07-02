#!/bin/bash
set -euo pipefail

path="${1-.}"

esc=$(printf '\033')
red="${esc}[31m"
format_reset="${esc}[0m"

IFS=$'\n'
for f in `find ${path} -name "*.pdf"`
do
  # each output line will have the format
  #   './path/to/file.pdf     Actual content from the PDF file line by line and'
  pdftotext "${f}" - | sed -e "s/^/${red}`echo ${f} | sed -s 's/\//\\\\\//g'`${format_reset}\t/"
done | fzf -d"\t" -n2 --ansi | cut -f1
