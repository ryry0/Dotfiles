xset +fp /usr/share/fonts/local
xset fp rehash
xrdb -merge ~/.Xresources
dropboxd &
xbacklight -set 0
eval $(cat ~/.fehbg)
syndaemon -k -i 2 &
exec spectrwm

