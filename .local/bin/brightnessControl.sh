#!/bin/bash

function send_notification() {
	brightness=$(printf "%.0f\n" $(brillo g))
	dunstify -a "changebrightness" -u low -r 9991 -h int:value:"$brightness" -i "brightness-$1" "Brightness: $brightness%" -t 2000
}

case $1 in
up)
  brightnessctl s 5%+
	send_notification $1
	;;
down)
	brightnessctl s 5%-
	send_notification $1
	;;
esac
