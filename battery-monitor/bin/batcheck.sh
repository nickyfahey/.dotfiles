#!/bin/bash

# paplay needs environment variable exported:
# export XDG_RUNTIME_DIR="/run/user/1000"


noice=/home/nicky/bin/suspend-error.oga
fullNoice=/home/nicky/bin/alert.wav


checkbat(){
	batStatus=$(cd /sys/class/power_supply/BAT1 && cat status)
	capacity=$(cd /sys/class/power_supply/BAT1 && cat capacity)

	# Charging
	# if [[ $batStatus != Discharging ]]; then
		# if (( $capacity >= 98 )); then
			# pw-play $fullNoice
		# fi
	# Discharging
	if [[ $batStatus == Discharging ]]; then
		if (( $capacity <= 5 )); then
			pw-play $noice
			# sleep 0.2s
			# pw-play $noice
			# sleep 0.2s
			# pw-play $noice
		# elif (( $capacity <= 10 )); then
		# 	pw-play $noice
		# 	sleep 0.2s
		# 	pw-play $noice
		# elif (( $capacity <= 12 )); then
		# 	pw-play $noice
		# elif (( $gamemode == 1 && $capacity <= 20 )); then
		# 	paplay $noice
		fi
	fi
}

while true
do
	checkbat
	sleep 5
done

