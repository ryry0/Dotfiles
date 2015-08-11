xset +fp /usr/share/fonts/local
xset fp rehash
xrdb -merge ~/.Xresources
syncthing -no-browser &
#xkbcomp ~/.mirrorboard.xkb $DISPLAY 2> /dev/null
xbacklight -set 40 
redshift -l 30.45:-84.25 -t 6500:3400 &
exec gnome-session
