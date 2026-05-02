#!/usr/bin/env bash

# Define the menu options with FontAwesome icons
shutdown=" "
reboot=" "
logout=""

# Pass the options to Rofi and store the result
options="$shutdown\n$reboot\n$logout"
chosen="$(echo -e "$options" | rofi -theme ~/.config/rofi/power.rasi -dmenu -selected-row 0)"

# Execute the corresponding command
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $logout)
        # Exits BSPWM gracefully
        pkill x
        ;;
esac
