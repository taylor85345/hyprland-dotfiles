#!/bin/bash

current=$(pamixer --get-volume)
volume=$(pamixer --get-volume-human)

pamixer -i 5
volume="$(pamixer --get-volume)"
dunstify -a "VOLUME" "Increasing to $volume%" -h int:value:$volume -i audio-volume-high-panel -r 2593 -u normal
canberra-gtk-play -i audio-volume-change -d "changevolume"
