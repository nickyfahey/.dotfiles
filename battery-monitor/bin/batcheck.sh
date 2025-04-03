#!/bin/bash

low_noise=/home/nicky/bin/suspend-error.oga
full_noise=/home/nicky/bin/alert.wav

check_bat(){
	status=$(cd /sys/class/power_supply/BAT1 && cat status)
	capacity=$(cd /sys/class/power_supply/BAT1 && cat capacity)

	# Charging
	# if [[ $status != Discharging ]]; then
		# if (( $capacity >= 98 )); then
			# pw-play $full_noise
		# fi

	# Discharging
	if [[ $status == Discharging ]]; then
		if (( $capacity <= 5 )); then
			pw-play $low_noise
		fi
	fi
}

while true
do
	check_bat
	sleep 5
done
