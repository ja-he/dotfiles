#!/bin/bash
mpc next -q;
sleep 0.5;
currentsong=$(mpc | head -n 1)
notify-send "▶ $currentsong" --expire-time=2000
