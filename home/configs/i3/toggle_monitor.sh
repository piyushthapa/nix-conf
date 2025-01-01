#!/bin/sh
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ "$m" = "eDP" ]; then
      xrandr --output eDP --off
      break
    fi
  done
fi
