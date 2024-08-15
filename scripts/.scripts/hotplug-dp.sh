#!/bin/bash

# read STATUS_DP < /sys/class/drm/card0-DP-1/status
# read STATUS_DP2 < /sys/class/drm/card0-DP-2/status
# read STATUS_DP3 < /sys/class/drm/card0-DP-3/status
# read STATUS_DP4 < /sys/class/drm/card0-DP-4/status
# read STATUS_HDMI < /sys/class/drm/card0-HDMI-A-1/status
# read STATUS_HDMI2 < /sys/class/drm/card0-HDMI-A-2/status

read STATUS_DP < /sys/class/drm/card1-eDP-1/status
read STATUS_HDMI < /sys/class/drm/card1-HDMI-A-1/status
#read STATUS_HDMI2 < /sys/class/drm/card0-HDMI-A-2/status
export DISPLAY=:0
#export XAUTHORITY=/home/jon/.Xauthority

maxlight() {
	/bin/cat /sys/class/backlight/intel_backlight/max_brightness > /sys/class/backlight/intel_backlight/brightness
}

lowdpi() {
	/bin/sed -i 's/Xft.dpi: .*/Xft.dpi: 96/' ~/.Xresources
	/usr/bin/sudo -E -u shwsun xrdb ~/.Xresources
}

hidpi() {
	/bin/sed -i 's/Xft.dpi: .*/Xft.dpi: 144/' ~/.Xresources
	/usr/bin/sudo -u shwsun xrdb ~/.Xresources
}

DEV=""
DEVC=""
STATUS="disconnected"
if [[ "$STATUS_HDMI" == "connected" ]]; then
	STATUS="connected"
	DEV="HDMI-1"
	DEVC="HDMI-A-1"
elif [[ "$STATUS_DP" == "connected" ]]; then
	STATUS="connected"
	DEV="eDP-1"
	DEVC="eDP-1"
elif [[ "$STATUS_HDMI2" == "connected" ]]; then
	STATUS="connected"
	DEV="HDMI-2"
	DEVC="HDMI-A-2"
fi

if [ "$STATUS_HDMI" == "connected" ]; then
	if [[ $1 == "mirror" ]]; then
		/usr/bin/xrandr --output $DEV --mode 3840x2160
		/usr/bin/xrandr --output eDP-1 --auto --same-as $DEV
	elif [[ $1 == "desktop" ]]; then
		/usr/bin/xrandr --output $DEV --mode 2560x1440
		/usr/bin/xrandr --output eDP-1 --off
	elif [[ $1 == "dual" ]]; then
		/usr/bin/xrandr --output $DEV --primary --mode 3840x2160
		/usr/bin/xrandr --output eDP-1 --auto --left-of $DEV
	else
		edid=$(/bin/cat /sys/class/drm/card0/card0-$DEVC/edid | /usr/bin/sha512sum - | /bin/sed 's/\s*-$//')
		printf $edid
	fi
else
	if [[ $1 == "mirror" ]]; then
		/usr/bin/xrandr --output $DEV --auto
	elif [[ $1 == "desktop" ]]; then
		/usr/bin/xrandr --output $DEV --auto
	elif [[ $1 == "dual" ]]; then
		/usr/bin/xrandr --output $DEV --auto
	else
		edid=$(/bin/cat /sys/class/drm/card0/card0-$DEVC/edid | /usr/bin/sha512sum - | /bin/sed 's/\s*-$//')
		printf $edid
	fi
fi

# notify-osd doesn't need to be restored
# /usr/bin/pkill notify-osd
# /usr/bin/sudo -E -u shwsun nitrogen --restore
# /usr/bin/sudo -E -u shwsun /home/shwsun/.config/polybar/launch.sh
# /usr/bin/pkill notify-osd
# /usr/bin/sudo -E -u shwsun nitrogen --restore
# /usr/bin/sudo -E -u shwsun /home/shwsun/.config/polybar/launch.sh
# /usr/bin/sudo -E -u shwsun /home/shwsun/bin/touchpad-setup.sh
# /usr/bin/systemctl restart systemd-logind
