#!/bin/bash

#UID=jethros
# Terminate already running bar instances
killall -q polybar

xsetroot -cursor_name left_ptr &

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if xrandr --query | grep " connected" | grep "HDMI-1" > /dev/null; then
  m=$(xrandr --query | grep " connected" | grep "HDMI-1" | cut -d" " -f1)
else
  m=$(xrandr --query | grep " connected" | grep primary | cut -d" " -f1)
fi

cmd=$(env "MONITOR=$m"  polybar --reload main)

if [[ $# -gt 0 ]] && [[ $1 = "block" ]]; then
  exec "${cmd[@]}"
else
  "${cmd[@]}" &
fi
