# mac-tools

Some handy tools for Mac OS X Terminal.

This project is heavily inspired by the project [Mac-CLI](https://github.com/guarinogabriel/Mac-CLI)
but without much installation.

## Installation

```bash
git clone https://github.com/duguyue100/mac-tools
```

Add the alias to the terminal profile:

```bash
alias mac="/path/to/mac-tools/mac"
```

And you are done!

## Usage

Get help!

```bash
mac list
# or
mac help
```

Shutdown your machine
```bash
mac shutdown
```

## Available functions

```
Mac OS X Terminal Tools
=======================
mac list/help: list all the available commands.
mac info: Get OS X version information
mac lock: Lock your mac
mac restart: Restart your mac
mac shutdown: Shutdown your mac
mac uptime: Get the time since last restart
mac sleep: Put your mac into sleep mode
mac clock: Show a clock at the top right of your terminal
mac battery: show battery status
mac fd.size: show the folder size.
mac fd.hid: list only hidden files in the folder.
mac hid.on: show hidden folders in Finder
mac hid.off: hide hidden dolfers in Finder
mac bt.stat: show the bluetooth status
mac bt.on: turn the bluetooth ON
mac bt.off: turn the bluetooth OFF
mac wifi.stat: show the status of WiFi
mac wifi.scan: scan available WiFI
mac wifi.on: turn your WiFi service ON
mac wifi.off: turn your WIFI service OFF
mac wifi.pass: get WiFi password
mac ejectall: eject all mounted volumes
=======================
```

## Contacts

Yuhuang Hu  
Email: duguyue100@gmail.com
