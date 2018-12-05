displaynum=`ls /tmp/.X11-unix/* | sed s#/tmp/.X11-unix/X##`
displaynum=0
export DISPLAY=":$displaynum.0"
export XAUTHORITY="/home/anton/.Xauthority"

function refresh {
    xmonad --restart
}

function get_by_status {
    echo $1
    return `xrandr -q | grep "$1" | cut -d' ' -f1 | sed -e 's/\n/ /g'`
}

function disconnect_disconnected {
    dis=$(get_by_status " disconnected")
	for dev in ${dis[@]}; do
		xrandr --output $dev --off
    done
}


disconnect_disconnected

con=$(get_by_status " connected")

if [ ${#con[*]} -eq 2 ]; then
	# Connect two monitors
    xrandr --output ${con[0]} --primary --auto --output ${con[1]} --auto --left-of ${con[0]}
	refresh
elif [ ${#con[*]} -eq 1 ]; then
    xrandr --output ${#con[0]} --auto --primary
	refresh
fi
