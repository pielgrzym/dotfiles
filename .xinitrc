#!/bin/sh
xset b 0 &
/usr/bin/autocutsel -fork &
/usr/bin/autocutsel -selection PRIMARY -fork &
setxkbmap pl
setxkbmap -option caps:escape
nitrogen --restore
xsetroot -cursor_name left_ptr
xbindkeys&
killall dropboxd&
dropboxd&
urxvtd&
PATH=$PATH:/home/pielgrzym/.zsh/bin
export PATH
# exec ck-launch-session subtle -n
exec ck-launch-session xmonad
