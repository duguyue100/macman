#!/bin/sh

_W_DEVICE=${_W_DEVICE:-en0}

case "$fn" in
    "info")
        sw_vers
    ;;

    "lock")
        osascript -e 'tell application "System Events" to keystroke "q" using {control down, command down}'
    ;;

    "uptime")
        uptime
    ;;

    # list of used ports
    "ports")
        echo "Getting list of used ports..."
        sudo lsof -iTCP -sTCP:LISTEN -P
    ;;

    "ip.loc")
        local_ip=$(ipconfig getifaddr en0)
        if [ $? != 0 ]; then
            local_ip=$(ipconfig getifaddr en1)
        fi

        echo "Your local IP address is: ${local_ip}"
    ;;

    "ip.pub")
        echo "Your public IP address is: $(wget http://ipinfo.io/ip -qO -)"
    ;;

    "fd.size")
        echo "Calculating folder size..."
        echo "Folder size:"
        du -sh .
    ;;

    "fd.hid")
        ls -a|grep "^\."
    ;;

    "hid.on")
         defaults write com.apple.finder AppleShowAllFiles YES; killall Finder
    ;;

    "hid.off")
        defaults write com.apple.finder AppleShowAllFiles NO; killall Finder
    ;;

    "wifi.stat")
        /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I
    ;;

    "wifi.scan")
        /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s
    ;;

    "wifi.on")
        networksetup -setairportpower ${_W_DEVICE} on
    ;;

    "wifi.off")
        networksetup -setairportpower ${_W_DEVICE} off
    ;;

    "wifi.pass")
        if [ -z "$1" ]
            then
                ssid="`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'`"
            else
                ssid=$1
        fi
        security find-generic-password -gw -a "$ssid"
    ;;

    "md5")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            md5 $firstParameter
        else
            echo "Please specify a file to calculate the MD5"
        fi
    ;;

esac
