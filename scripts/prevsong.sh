#!/bin/bash

echo '{ "command": ["playlist-prev"] }' | socat - /tmp/mpv-socket
