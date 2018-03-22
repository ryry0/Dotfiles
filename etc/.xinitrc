xrdb -merge ~/.themes.d/paper.Xresources
if grep -qE "(Microsoft|WSL)" /proc/version &> /dev/null; then
        xrdb -merge ~/.themes.d/verybig.Xresources
fi
#syncthing -no-browser &
xkbcomp ~/.metacaps.xkb $DISPLAY 2> /dev/null
#xbacklight -set 40 
syndaemon -k -i 1 -d -R
~/.fehbg.sh &
unclutter -noevents &
#redshift -l 41.49:-81.69 -t 6500:3400 &
compton -f -O 0.1 -I 0.1 --backend xrender -b
#google-chrome-stable &
#/home/ryan/usr/bin/reconnect.sh &
#sudo tlp start
VBoxClient-all
sxhkd &
urxvt -name quake -e tmux &
exec bspwm
