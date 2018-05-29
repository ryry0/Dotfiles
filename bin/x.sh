export DISPLAY=:0
urxvtd -q -o -f
urxvtc -e ~/wslxmingclient.sh && sleep 1s &&
urxvtc -name ssh
