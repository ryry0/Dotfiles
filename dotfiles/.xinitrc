xset +fp /usr/share/fonts/local
xset fp rehash
xrdb -merge ~/.Xresources
syncthing -no-browser &
xbacklight -set 40 
eval $(cat ~/.fehbg)
syndaemon -k -i 1 -d -R
unclutter -noevents &
redshift -l 30.45:-84.25 -t 6500:3400 &
exec spectrwm
