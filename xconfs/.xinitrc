#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xinput set-prop 11 273 1 &
xset fp+ ~/.local/share/fonts &
xset fp rehash &
fc-cache &
sxhkd &
xrdb ~/.Xresources
#exec openbox
exec bspwm
#exec berry
