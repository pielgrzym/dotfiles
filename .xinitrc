#!/bin/sh
xrandr --output DVI-I-1 --mode 1600x1200
xrandr --output DVI-I-2 --mode 1920x1080 --right-of DVI-I-1
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
export $PATH
source $HOME/.rvm/scripts/rvm
exec ck-launch-session subtle &> $HOME/.subtle.log
