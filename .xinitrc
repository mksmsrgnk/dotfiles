xrdb -merge -I $HOME ~/.Xresources
setxkbmap -layout us,ru
setxkbmap -model pc105
setxkbmap -variant qwerty
setxkbmap -option grp_led:caps
setxkbmap -option caps:escape
setxkbmap -option grp:win_space_toggle
setxkbmap -option ctrl:swap_lwin_lctl
xinput set-button-map 7 1 2 3 4 5 6 7 9 8 10 11 12 13
xset -b
exec i3
