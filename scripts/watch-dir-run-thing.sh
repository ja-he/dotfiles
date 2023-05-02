#!/bin/bash

dbg() {
  local msg="${1}"
  echo "$(tput setaf 3)[$(tput smul)$(date +'%H:%M:%S')$(tput rmul)]$(tput sgr0) $(tput bold)${msg}$(tput sgr0)" 1>&2
}

directory="$1"
regex_pattern="$2"
cmd_recipe="$3"

if [ -z "$directory" ] || [ -z "$regex_pattern" ] || [ -z "$cmd_recipe" ]; then
  dbg "Usage: $0 /path/to/directory \"regex_pattern\" \"cmd_recipe (can use \$FILE)\""
  exit 1
fi

# Check if the directory exists
if [ ! -d "$directory" ]; then
  dbg "Error: Directory '$directory' does not exist."
  exit 1
fi

inotifywait --monitor -q -e modify,create,delete --format "%f" "$directory" | while read -r changed_file; do
  # Check if the file name matches the regex pattern
  if [[ "$changed_file" =~ $regex_pattern ]]; then
    export FILE="${directory%%/}/${changed_file}"
    dbg "file ${changed_file} matched the pattern, -> path:'${FILE}'"
    cmd=$(echo "$cmd_recipe" | envsubst)
    dbg "filled command is '${cmd}'"
    eval "${cmd}" &&
      dbg "command succeeded 🎉" ||
      dbg "command failed 😱"
  else
    dbg "file '$changed_file' did not match regex, ignoring... 😎"
  fi
done
