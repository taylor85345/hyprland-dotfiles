#!/bin/bash

DEFAULT_SINK=$(pactl info | grep "Default Sink" | cut -d " " -f3)
pactl set-sink-mute "$DEFAULT_SINK" toggle
dunstify -a "VOLUME" "MUTED" -h int:value:$volume -i audio-volume-muted-symbolic -r 2593 -u normal
canberra-gtk-play -i audio-volume-change -d "changevolume"
