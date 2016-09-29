#!/bin/sh

_W_DEVICE=${_W_DEVICE:-en0}

case "$fn" in
    "info")
        sw_vers
    ;;

    "lock")
        /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
    ;;

    "restart")
        osascript -e 'tell app "loginwindow" to «event aevtrrst»'
    ;;

    "sleep")
        pmset sleepnow
    ;;

    "shutdown")
        osascript -e 'tell app "loginwindow" to «event aevtrsdn»'
    ;;

    "uptime")
        uptime
    ;;

    # show the clock at the top right of the terminal
    "clock")
        if [ -z "$(pgrep macClock)"   ]; then
            # naming the process
            ( exec -a macClock bash -c 'while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done' &   )
        else
            pkill macClock
        fi
    ;;

    "battery")
        pmset -g batt
    ;;

    "folder:size")
        echo "Calculating folder size..."
        echo "Folder size:"
        du -sh .
    ;;

    "hid:show")
         defaults write com.apple.finder AppleShowAllFiles YES; killall Finder
    ;;

    "hid:hide")
        defaults write com.apple.finder AppleShowAllFiles NO; killall Finder
    ;;

    "bt:status")
        defaults read /Library/Preferences/com.apple.Bluetooth ControllerPowerState | \
            awk '{ if($1 != 0) {print "Bluetooth: ON"} else { print "Bluetooth: OFF" }  }'
    ;;

    "bt:on")
        echo "${GREEN}Bluetooth enabled{NC}"
        sudo defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState -int 1 && \
            sudo killall -HUP blued
    ;;

    "bt:off")
        echo "${GREEN}Bluetooth disabled${NC}"
        sudo defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState -int 0 && \
            sudo killall -HUP blued
    ;;

    "wifi:status")
        /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I
    ;;

    "wifi:scan")
        /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s
    ;;

    "wifi:on")
        networksetup -setairportpower ${_W_DEVICE} on
    ;;

    "wifi:off")
        networksetup -setairportpower ${_W_DEVICE} off
    ;;

    "wifi:pass")
        if [ -z "$1" ]
            then
                ssid="`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'`"
            else
                ssid=$1
        fi
        security find-generic-password -D "AirPort network password" -a "$ssid" -gw
    ;;

    "ejectall")
        osascript -e 'tell application "Finder" to eject (every disk whose executable is true)'
    ;;


esac
