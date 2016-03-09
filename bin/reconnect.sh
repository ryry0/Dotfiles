#!/bin/bash

QUERIES=0
DISCONNECTIONS=-1

while true; do

CONNECTION=$(sudo wpa_cli -i wlan0 status | sed -n 's/^ssid=//p')
let QUERIES+=1

	#printf "\n"
	#echo Queried connection $QUERIES time\(s\)

	if [ "$CONNECTION" == "" ]; then
		let DISCONNECTIONS+=1
		printf "\n\n"
		echo Internet was disconnected $DISCONNECTIONS time\(s\)
		echo Reconnecting...
		sudo $HOME/usr/bin/wifi.sh
	fi

	sleep 15

done
