#!/bin/bash

sudo wpa_supplicant -B -i wlan0 -Dnl80211 -c/etc/wpa_supplicant.conf && sudo dhcpcd wlan0
