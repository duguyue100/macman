# macman

[![GitHub release](https://img.shields.io/github/release/duguyue100/macman.svg?maxAge=2592000)](https://github.com/duguyue100/macman)

_Some handy tools for Mac OS X Terminal._

This project is heavily inspired by the project [Mac-CLI](https://github.com/guarinogabriel/Mac-CLI)
but without much installation.

The project name is suggested by [Mario](https://github.com/kmario23)

## Installation

```bash
git clone https://github.com/duguyue100/macman
```

Add the alias to the terminal profile:

```bash
alias mac="/path/to/macman/macman"
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

## Available Functions - 111 and counting...

```
Mac OS X Terminal Tools
==============================================================
mac list/help  : List all the available commands.
mac info       : Get OS X version information
mac lock       : Lock your mac
mac restart    : Restart your mac
mac shutdown   : Shutdown your mac
mac uptime     : Get the time since last restart
mac mem        : Get the memory status
mac speed      : Network speed test (with npm's fast-cli package)
mac ports      : List all used ports
mac ip.loc     : Get Local IP address
mac ip.pub     : Get Public IP address
mac sleep      : Put your mac into sleep mode
mac clock      : Show a clock at the top right of your terminal
mac battery    : Show battery status
mac fd.size    : Show the folder size.
mac fd.hid     : List only hidden files in the folder.
mac hid.on     : Show hidden folders in Finder
mac hid.off    : Hide hidden dolfers in Finder
mac bt.stat    : Show the bluetooth status
mac bt.on      : Turn the bluetooth ON
mac bt.off     : Turn the bluetooth OFF
mac wifi.stat  : Show the status of WiFi
mac wifi.scan  : Scan available WiFI
mac wifi.on    : Turn your WiFi service ON
mac wifi.off   : Turn your WIFI service OFF
mac wifi.pass  : Get WiFi password
mac vpn.start  : Start a VPN.
mac vpn.stop   : Stop a VPN.
mac vpn.ls     : List all available VPNs.
mac ejectall   : Eject all mounted volumes
mac md5        : Calculate MD5 for a file
--------------------------------------------------------------
Git Related
mac g.init     : Init a Git repository locally
mac g.clone    : Clone a project through URL
mac g.log      : Get the log of the project
mac g.stat     : Print the status of the proejct
mac g.open/go  : Open the Git repo from URL
mac g.size     : Calculate the size of Git Repo
mac g.re       : Add an push/pull origin
mac g.conf     : List the git configuration
mac g.undo     : Undo last commit
mac g.add      : Stage a file
mac g.add.all  : Stage all the changes
mac g.commit   : Commit the changes
mac g.ac       : Stage a file and commit
mac g.aca      : Stage all changes and commit
mac g.acp      : Stage file, commit and push
mac g.acap     : Stage all, commit and push
mac g.mv       : Move file to new destination
mac g.rm       : Remove file.
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
mac g.lfs.init : Init LFS storage
mac g.lfs.tk   : LFS track files
mac g.lfs.untk : LFS untrack files
mac g.lfs.ls   : List all tracked files
mac g.lfs.conf : Get the environment variables for the LFS.
--------------------------------------------------------------
Functors - extra tools
mac pdf.html   : Convert a PDF to HTML via pdf2htmlEX
mac wttr       : Show the weather for a city.
mac top10      : Show the top10 used shell commands.
mac starwar    : Text based Starwar IV
mac cal        : Get 5 days agenda
mac cal.week   : Get this week's detail calendar
mac cal.mon    : Get this month's detail calendar
mac cal.add    : Add a quick event
mac say        : Text to speech
mac mail       : Open GMail
mac compose    : Compose new email through GMail
mac compute    : A Calculator
mac define     : Define word with Dictionary app
mac ol.open    : Open a Overleaf Project
mac imshow     : Show image in terminal via iTerm2
mac ascii      : Print ASCII table
mac vim        : Open online VIM cheatsheet
--------------------------------------------------------------
Compressor
mac lszip      : List file in a ZIP archive.
mac zip        : Zip a file or folder.
mac unzip      : Unzip a file or folder.
mac lstar      : List file in a tar archive.
mac tar        : Tar a file or folder.
mac untar      : Untar a file or folder.
--------------------------------------------------------------
Terminal Multiplexer (screen and tmux)
mac s.at       : Create a new screen session
mac s.re       : Reattach a screen session
mac s.de       : Detach a screen session
mac s.rm       : Remove a screen session
mac s.ls       : List all available screen session(s)
mac t.at       : Create a new tmux session
mac t.re       : Reattach a tmux session
mac t.de       : Detach a tmux session
mac t.rm       : Remove a tmux session
mac t.rm.all   : Remove all tmux session(s)
mac t.ls       : List all available tmux session(s)
mac t.div.h    : Split pane horizontally
mac t.div.v    : split pane vertically
mac t.go.left  : Go left pane
    (tl)
mac t.go.right : Go right pane
    (tr)
mac t.go.up    : Go above pane
    (tu)
mac t.go.down  : Go below pane
    (td)
mac tpx        : Kill current pane
==============================================================
```

## Tools for Extra Functions

### Network speed test

This function is provided by `npm`'s `fast-cli` package, can be installed by

```
npm install fast-cli
```

### Git related

One could install Git from popular packaging management systems or visit [Git-website](https://git-scm.com/).

### Git LFS

One could install Git LFS from [Git LFS](https://git-lfs.github.com/)

### PDF2HTML

`pdf2htmlEX` is one awesome tool for converting from PDF to HTML

### Google Calendar

You can install [Google Calendar Commandline tool](https://github.com/insanum/gcalcli) by

```
pip install gcalcli
```

and then install optional package by

```
pip install vobject parsedatetime
```

### Open Overleaf from cloned project

The `git` URL that is given by Overleaf cannot be opened.
Therefore, one can use `ol.open` to open the corresponding project from terminal.

### VPN

One can start VPN service by specifying predefined VPN port.
If you don't want to key in the name of the VPN port repeatedly, one can
create a file `vpn.sh` under `res` folder and write following script:

```bash
#!/bash/sh

export VPN_PORT="VPN NAME"
```

Then you should be able to start or stop this VPN service without the parameter.

### Show image in terminal

If you are using [iTerm2](https://www.iterm2.com/index.html), then you can show
image in terminal via [imgcat](https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgcat).

_Note this function only works with iTerm2_

Download `imgcat` and place at `res` folder. Then do

```bash
chmod +x imgcat
```

And then you can use this function.

### Terminal Multiplexer

Mac has one old version of `screen` within the system, there are 5 basic
commands available.

You can insteall `tmux` through MacPorts, and the you can use a richer set of
commands to manage your terminal.

## Contacts

Yuhuang Hu  
Email: duguyue100@gmail.com
