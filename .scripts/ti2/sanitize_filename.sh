#!/usr/bin/env bash

function sanitize_filename() {
  filename="${1}"
  # TODO: verify filename

  prefix=$(echo ${filename} | cut -d'_' -f1,2 )
  names=$(echo ${filename} | cut -d'_' -f3- | tr [A-Z] [a-z])
  echo ${prefix}_${names}
}

while read filename; do
  sanitize_filename "${filename}"
done
