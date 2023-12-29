#! /bin/bash

monitors=/tmp/hypr/monitors_temp
hyprctl monitors > $monitors

if [[ -z $1 ]]; then
  workspace=$(grep -B 5 "focused: no" "$monitors" | awk 'NR==1 {print $3}')
else
  workspace=$1
fi


activemonitor=$(grep -B 11 "focused: yes" "$monitors" | awk 'NR==1 {print $2}')
passivemonitor=$(grep  -B 7 "($workspace)" "$monitors" | awk 'NR==1 {print $2}')
#activews=$(grep -A 2 "$activemonitor" "$monitors" | awk 'NR==3 {print $1}' RS='(' FS=')')
passivews=$(grep -A 4 "$passivemonitor" "$monitors" | awk 'NR==4 {print $1}' RS='(' FS=')')

if [[ $workspace -eq $passivews ]] && [[ $activemonitor != "$passivemonitor" ]]; then
  hyprctl dispatch swapactiveworkspaces "$activemonitor" "$passivemonitor"
  echo $activemonitor $passivemonitor
else
  hyprctl dispatch moveworkspacetomonitor "$workspace $activemonitor" && hyprctl dispatch workspace "$workspace"
fi

exit 0
