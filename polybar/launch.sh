#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
echo "---" | tee -a /tmp/polybar.log
polybar left -c ~/.config/i3/polybar/config.ini 2>&1 | tee -a /tmp/polybar-left.log & disown
polybar center -c ~/.config/i3/polybar/config.ini 2>&1 | tee -a /tmp/polybar-center.log & disown
polybar right -c ~/.config/i3/polybar/config.ini 2>&1 | tee -a /tmp/polybar-right.log & disown

echo "Polybar instances launched..."