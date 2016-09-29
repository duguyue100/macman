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

## Available functions - 45 and counting...

```
Mac OS X Terminal Tools
==============================================================
mac list/help : List all the available commands.
mac info      : Get OS X version information
mac lock      : Lock your mac
mac restart   : Restart your mac
mac shutdown  : Shutdown your mac
mac uptime    : Get the time since last restart
mac mem       : Get the memory status
mac speed     : Network speed test (with npm's fast-cli package)
mac ports     : List all used ports
mac ip.loc    : Get Local IP address
mac ip.pub    : Get Public IP address
mac sleep     : Put your mac into sleep mode
mac clock     : Show a clock at the top right of your terminal
mac battery   : Show battery status
mac fd.size   : Show the folder size.
mac fd.hid    : List only hidden files in the folder.
mac hid.on    : Show hidden folders in Finder
mac hid.off   : Hide hidden dolfers in Finder
mac bt.stat   : Show the bluetooth status
mac bt.on     : Turn the bluetooth ON
mac bt.off    : Turn the bluetooth OFF
mac wifi.stat : Show the status of WiFi
mac wifi.scan : Scan available WiFI
mac wifi.on   : Turn your WiFi service ON
mac wifi.off  : Turn your WIFI service OFF
mac wifi.pass : Get WiFi password
mac ejectall  : Eject all mounted volumes
--------------------------------------------------------------
Git Related
mac g.log      : Get the log of the project
mac g.stat     : Print the status of the proejct
mac g.open     : Open the Git repo from URL
mac g.size     : Calculate the size of Git Repo
mac g.add      : Add an push/pull origin
mac g.conf     : List the git configuration
mac g.undo     : Undo last commit
mac g.push     : Push to current branch
mac g.pull     : Pull to current branch
mac g.merge    : Merge a specific branch
mac g.th.bh    : Touch (create) a new branch
mac g.th.re.bh : Touch (clone) a remote branch
mac g.co.bh    : Checkout a existing branch
mac g.co.re.bh : Checkout a remote branch
mac g.ls.bh    : List all the branch
mac g.rm.bh    : Remove a local branch
mac g.rm.re.bh : Remove a branch from local and remote
--------------------------------------------------------------
Functors - extra tools
mac pdf.html   : convert a PDF to HTML via pdf2htmlEX
==============================================================
```

## Contacts

Yuhuang Hu  
Email: duguyue100@gmail.com
