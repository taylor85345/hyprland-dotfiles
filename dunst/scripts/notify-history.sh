#! /bin/bash

socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | while read -r event; do
  if [[ $event == "closelayer>>notifications" ]]; then
    echo $event
    dunstctl history >/tmp/dunst-history.json
    exit
  fi
done
