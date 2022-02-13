#!/usr/bin/bash

HIGH=82
LOW=52

while [[ 1 ]];
do
	t=$(sensors -u | grep Package -A3 | grep input | awk -F ": " '{print $2}')
	t=$(echo $t | cut -d '.' -f 1)
	echo -n "$(date) current_temp = $t : "

	if [[ "$t" -ge "$HIGH" ]]; then
		echo "(H) setting powersave"
		cpufreq-set -g powersave
		sleep 20
	elif [[ "$t" -le "$LOW" ]]; then
		echo "(L) setting ondemand"
		cpufreq-set -g ondemand
		sleep 20
	else
		echo "(N) no change"
	fi

	sleep 10
done
