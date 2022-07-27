#!/bin/bash

current=$(pamixer --get-volume)
volume=$(pamixer --get-volume-human)

pamixer -d 5
volume="$(pamixer --get-volume)"
dunstify -a "VOLUME" "Decreasing to $volume%" -h int:value:$volume -i audio-volume-low-panel -r 2593 -u normal
canberra-gtk-play -i audio-volume-change -d "changevolume"
