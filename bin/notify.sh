#!/bin/bash

# how long should the popup remain?
duration=5

# define geometry
barx=20
bary=20
#barw=60
barh=20

# colors
bar_bg='#ff333333'
bar_fg='#ffffffff' # white is default

# font used
bar_font=-*-terminus-medium-r-normal--16-*-*-*-*-*-*-*
#catecho () {
text=$(
    if read -t 0; then
        cat
    else
	echo "$@"
    fi
); 
#}
barw=$(echo " $text" | wc -m);
barw=$(( $barw * 8));
#Create the popup 
(echo " $text"; sleep ${duration}) | 
bar -g ${barw}x${barh}+${barx}+${bary} -B${bar_bg} -f ${bar_font}
