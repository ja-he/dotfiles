#!/usr/bin/env bash

function sanitize_filename() {
  filename="${1}"
  # TODO: verify filename

  ex=$(echo ${filename} | cut -d'_' -f1 | tr [A-Z] [a-z])
  group=$(echo ${filename} | cut -d'_' -f2)
  names=$(echo ${filename} | cut -d'_' -f3- | tr [A-Z] [a-z])
  echo ${ex}_${group}_${names}
}

while read filename; do
  sanitize_filename "${filename}"
done
