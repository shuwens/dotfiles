#!/bin/bash

#pkill nm-applet &

sleep 3

#~/Scripts/start_HUD.sh &
#/usr/bin/nm-applet &
/usr/bin/insync start &
/usr/bin/hp-systray &
/usr/bin/megasync &
/opt/dropbox/dropbox &
/usr/bin/xscreensaver --no-splash
