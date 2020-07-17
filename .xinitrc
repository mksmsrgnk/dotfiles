xrdb -merge -I $HOME ~/.Xresources
setxkbmap -layout us,ru
setxkbmap -option 'grp:caps_toggle'
xinput set-button-map 7 1 2 3 4 5 6 7 9 8 10 11 12 13
exec i3
