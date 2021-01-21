#!/usr/bin/env bash

# You might have to do some legwork and implement this function yourself.
# This is supposed to take the description timestamp format and convert it to
# the format
#   '<timestamp>|<title>'.
# So for example if a track starts at 12:34 and is title 'Asdf Jkl' its input
# format might be '01 [12:34] Asdf Jkl' and this function is supposed to turn
# that into
#   '12:34|Asdf Jkl'.
# (Here the single quotes are not part of the content.)
parse_timestamp_line_a() {
  # Takes format
  #  '<tracknum> [<timestamp>] <title>' e.g. '11 [43:30] Quiet and Falling'
  # and turns it into
  #  '<timestamp>|<title>'              e.g. '43:30|Quiet and Falling'.
  cut -c5- \
    | while IFS=']' read timestamp title
      do
        title="$(echo "${title}" | xargs)"
        echo "${timestamp}|${title}"
      done
}
parse_timestamp_line_b() {
  # Takes format
  #  '<timestamp> - <title>' e.g. '17:24 - Dawn'
  # and turns it into
  #  '<timestamp>|<title>'              e.g. '17:24|Dawn'.
  while IFS='-' read timestamp title
  do
    title="${title# }"
    timestamp="${timestamp% }"
    echo "${timestamp}|${title}"
  done
}

get_filename() {
  tracknum="$1"
  title="$2"
  echo "${tracknum} - ${title}.mp3"
}

if [[ -z "$1" ]]
then
  echo "no URL provided, exiting"
  exit 0
fi

url="$1"
description_file=.description
big_file='.full.mp3'
order='timestamp-first'

# get file
youtube-dl --extract-audio --audio-quality 0 --audio-format mp3 ${url}

# move to where i want it
ytdl_filename="$(youtube-dl --get-filename ${url})"
ytdl_filename="${ytdl_filename%.webm}"
ytdl_filename="${ytdl_filename%.mp4}"
ytdl_filename="${ytdl_filename}.mp3"
mv "${ytdl_filename}" ${big_file}

# get description into file
youtube-dl --get-description ${url} > ${description_file}

# parse description
prev_timestamp=''
prev_title=''
cat ${description_file} \
  | grep -P '[0-9]{2}:[0-9]{2}' \
  | parse_timestamp_line_b \
  | while IFS='|' read timestamp title
    do
      if [[ -n ${prev_timestamp} ]]
      then
        echo "${prev_timestamp}|${timestamp}|${prev_title}"
      fi
      prev_timestamp=${timestamp}
      prev_title="${title}"
    done \
  | while tracknum=0 IFS='|' read start end title
    do
      tracknum=$((${tracknum}+1))
      ffmpeg \
        -i "${big_file}" \
        -acodec copy \
        -ss ${start} \
        -to ${end} \
        "$(get_filename ${tracknum} "${title}")"
    done

# clean up
rm ${description_file}
rm ${big_file}
