#!/bin/bash

# Keymap
# setxkbmap no;
setxkbmap -option compose:rctrl
setxkbmap -option altwin:swap_alt_win
setxkbmap -option ctrl:swapcaps     # Swap Left Control and Caps Lock

if test -e /usr/bin/xmodmap; then
  if test -e .Xmodmap; then
    xmodmap .Xmodmap
  fi
fi

# gnupg keyring agent
# ensure it's started so SSH will work
# https://www.gnupg.org/faq/whats-new-in-2.1.html#autostart
dbus-update-activation-environment --systemd DISPLAY
gpgconf --launch gpg-agent
export "SSH_AUTH_SOCK=/run/user/$(id -u)/gnupg/S.gpg-agent.ssh"

# sudo -E -u jethros ~/.scripts/hotplug-dp.sh dual &
# Update screen layout
# if [ -e ~/.scripts/hotplug-dp.sh ]; then
    # (
    #   sleep .2;
    #   sudo -E -u jethros ~/.scripts/hotplug-dp.sh dual;
    # ) &
# fi

# Start WM
xsetroot -cursor_name left_ptr

bspwm 2> .logs/bspwm.err > .logs/bspwm.log
