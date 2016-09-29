#!/bin/sh

case "$fn" in
    "list"|"help")
        echo "Mac OS X Terminal Tools"
        echo "======================="
        echo "mac list/help: list all the available commands."
        echo "mac info: Get OS X version information"
        echo "mac lock: Lock your mac"
        echo "mac restart: Restart your mac"
        echo "mac shutdown: Shutdown your mac"
        echo "mac uptime: Get the time since last restart"
        echo "mac sleep: Put your mac into sleep mode"
        echo "mac clock: Show a clock at the top right of your terminal"
        echo "mac battery: show battery status"
        echo "mac folder:size: show the folder size."
        echo "mac hid:show: show hidden folders in Finder"
        echo "mac hid:hide: hide hidden dolfers in Finder"
        echo "mac bt:status: show the bluetooth status"
        echo "mac bt:on: turn the bluetooth ON"
        echo "mac bt:off: turn the bluetooth OFF"
        echo "mac wifi:status: show the status of WiFi"
        echo "mac wifi:scan: scan available WiFI"
        echo "mac wifi:on: turn your WiFi service ON"
        echo "mac wifi:off: turn your WIFI service OFF"
        echo "wifi:pass: get WiFi password"
        echo "ejectall: eject all mounted volumes"
        echo "======================="
esac
