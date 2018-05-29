export DISPLAY=:0
urxvtd -q -o -f
urxvtc -e xrdb -merge ~/.themes.d/paper.Xresources && sleep 1s &&
urxvtc -e ssh ryan@localhost -p 10001
