#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# keyboard setup
/usr/bin/setxkbmap -option 'ctrl:swapcaps'
/usr/bin/setxkbmap -option 'altwin:swap_alt_win'
# Keymap
if test -e /usr/bin/xmodmap; then
  if test -e .Xmodmap; then
    xmodmap .Xmodmap
  fi
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# xset +fp /usr/share/fonts/local &

# gnupg keyring agent
# ensure it's started so SSH will work
# https://www.gnupg.org/faq/whats-new-in-2.1.html#autostart
dbus-update-activation-environment --systemd DISPLAY
gpgconf --launch gpg-agent 
export "SSH_AUTH_SOCK=/run/user/$(id -u)/gnupg/S.gpg-agent.ssh"

# Update screen layout
if [[ -e ~/bin/hotplug-dp.sh ]]; then
    (
      sleep .2;
      sudo -E -u jethros ~/bin/hotplug-dp.sh dual;
    ) &
fi

# Start WM
xsetroot -cursor_name left_ptr

# bspwm 2> .logs/bspwm.err > .logs/bspwm.log
exec bspwm
