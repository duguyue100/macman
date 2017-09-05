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

    "mem")
        htop
    ;;

    # if you have fast-cli package from npm
    "speed")
        $HOME/node_modules/.bin/fast
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

    "bt.stat")
        defaults read /Library/Preferences/com.apple.Bluetooth ControllerPowerState | \
            awk '{ if($1 != 0) {print "Bluetooth: ON"} else { print "Bluetooth: OFF" }  }'
    ;;

    "bt.on")
        echo "${GREEN}Bluetooth enabled{NC}"
        sudo defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState -int 1 && \
            sudo killall -HUP blued
    ;;

    "bt.off")
        echo "${GREEN}Bluetooth disabled${NC}"
        sudo defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState -int 0 && \
            sudo killall -HUP blued
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
        security find-generic-password -D "AirPort network password" -a "$ssid" -gw
    ;;

    "ejectall")
        osascript -e 'tell application "Finder" to eject (every disk whose ejectable is true)'
    ;;

    "md5")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            md5 $firstParameter
        else
            echo "Please specify a file to calculate the MD5"
        fi
    ;;

    "vpn.start")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            scutil --nc start "$firstParameter"
        elif [ -f "$MAC/res/vpn.sh" ]; then
            source "$MAC/res/vpn.sh"
            scutil --nc start "$VPN_PORT"
        else
            echo "Please specify a available VPN port or add your VPN configuration at /res/vpn.sh"
        fi
    ;;

    "vpn.stop")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            scutil --nc stop "$firstParameter"
        elif [ -f "$MAC/res/vpn.sh" ]; then
            source "$MAC/res/vpn.sh"
            scutil --nc stop "$VPN_PORT"
        else
            echo "Please specify a available VPN port or add your VPN configuration at /res/vpn.sh"
        fi
    ;;

    "vpn.ls")
        scutil --nc list
    ;;

esac
