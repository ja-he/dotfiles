IFS=$'\n'

if [[ $1 == "-h" ]]; then
  echo "utility to get the listed packages from a latex log file"
  echo "        (you have to have \\listfiles in the preamble for the packages"
  echo "         to show up in the log file)"
  echo
  echo "usage:    <scriptname>                       <logfilename>"
  echo "example:   /home/ztf/.scripts/package-finder  main.log"
  echo
  exit 0
fi

for line in $(cat $1 | grep -E '^ *[[:alnum:]-]*\.sty'); do
  line="${line%.sty*}"
  echo "$line" | tr -d '[:space:]'
  echo
done
