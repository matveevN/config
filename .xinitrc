
xrandr --dpi 144
feh --bg-scale /home/nikita/wallpaper/naushniki_chernyj_belyj_192823_3840x2160.jpg

setxkbmap -layout "us,ru" -option "grp:rctrl_toggle"
setxkbmap -option ctrl:swapcaps


slstatus &
redshift -O 4500 &
dunst &
exec dbus-launch --sh-syntax --exit-with-session dwm 
