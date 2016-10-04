xrdb -merge ~/.themes.d/paper.Xresources
#syncthing -no-browser &
xkbcomp ~/.metacaps.xkb $DISPLAY 2> /dev/null
xbacklight -set 40 
feh  --bg-scale $(find ~/walls -type f | shuf -n 1)
syndaemon -k -i 1 -d -R
unclutter -noevents &
redshift -l 41.49:-81.69 -t 6500:3400 &
compton -f -O 0.1 -I 0.1 --backend glx -b
google-chrome-stable &
#/home/ryan/usr/bin/reconnect.sh &
#sudo tlp start
#exec bspwm
