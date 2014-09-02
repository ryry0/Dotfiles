#!/bin/sh
#
# z3bra - (c) wtfpl 2014
# check battery level, and raise a notification if the capacity is
# under a defined level

LEVL=82
BATC=$(sed 's/%//' /sys/class/power_supply/BAT1/capacity)

test ${BATC} -le ${LEVL} && echo "battery level: $BATC" | notify.sh 
