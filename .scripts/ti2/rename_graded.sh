#!/usr/bin/env bash

function rename_graded() {
  filename="${1}"
  # TODO: verify filename

  echo ${filename%.pdf}_korrektur.pdf
}

while read filename; do
  rename_graded "${filename}"
done
