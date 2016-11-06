#!/bin/sh

while true; do
feh  --bg-scale $(find ~/walls -type f | shuf -n 1)
sleep 5h
done
