#!/bin/bash

# urxvt-quake.sh - yuri - Jun 2014

# toggles a tilda/guake/yakuake-like urxvt window
# requires wmctrl, openbox, and custom .config/openbox/rc.xml settings

# online forum example scripts use xdotool - wmctrl is faster

# copy/paste to rc.xml in the applications section
#
# <application name="URxvtQuake">
#   <decor>no</decor>
#   <position force="yes">
#     <x>center</x>
#     <y>0</y>
#   </position>
#   <animateIconify>no</animateIconify>
#   <skip_taskbar>yes</skip_taskbar>
#   <skip_pager>yes</skip_pager>
#   <layer>above</layer>
#   <focus>yes</focus>
#   <desktop>all</desktop>
# </application>
#
# for similar funcionality in bspwm, this script is less useful, instead map this to a key in sxhkdrc:
#   (note, geometry is hard coded into the keymapped command in this case)
#  xdotool search --onlyvisible --classname URxvtQuake windowunmap \
#    || xdotool search --classname URxvtQuake windowmap \
#    || urxvt -name URxvtQuake -geometry 110x20+297+1
#
# and add this rule to bspwmrc
# bspc rule -a URxvtQuake sticky=on floating=on

# grab the window ID of the urxvt-quake terminal window
WINID=`wmctrl -lx | grep URxvtQuake.URxvt | awk '{ print $1 }'`

# if no existing window, start the terminal
if [ -z "$WINID" ]; then
        urxvt -name URxvtQuake &
        wmctrl -i -r $(sleep 0.2; wmctrl -lx | grep URxvtQuake.URxvt | awk '{ print $1 }') -b add,fullscreen

else # toggle hidden
  wmctrl -i -r $WINID -b toggle,hidden
  #wmctrl -i -r $WINID -b add,fullscreen
  # if window is visible, activate it
  [ -z "$(xprop -id $WINID | grep HIDDEN)" ] && wmctrl -i -R $WINID
fi
