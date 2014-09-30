#!/bin/bash
SLEEP_SEC=15
#loops forever outputting a line every sleep_sec seconds

while :; do
	WLAN=$(wpa_cli -i wlp2s0 status | sed -n 's/^ssid=//p')
	BATT=$(acpi | cut -f2 -d ',' | tr -d " ")
	DATE=$(date +%b-%d)
	TIME=$(date +%I:%M%p)
	echo -e [$WLAN][$BATT][$DATE][$TIME]
	sleep $SLEEP_SEC
done
