xset +fp /usr/share/fonts/local
xset fp rehash
xrdb -merge ~/.Xresources
syncthing -no-browser &
xbacklight -set 40 
eval $(cat ~/.fehbg)
syndaemon -k -i 1 -d -R
unclutter -noevents &
exec spectrwm
