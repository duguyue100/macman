#!/bin/sh

# Functions about terminal multiplexer

case "$fn" in
    # reattach a screen session
    "s.re")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            screen -r "$firstParameter"
        else
            echo "Please specify which session you want to attach"
        fi
    ;;

    # detach a screen session
    "s.de")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            screen -d "$firstParameter"
        else
            screen -d "$STY"
        fi
    ;;

    # list screen sessions
    "s.ls")
        screen -ls
    ;;

    # attach/create a screen session
    "s.at")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            screen -S "$firstParameter"
        else
            screen
        fi
    ;;

    # quit a screen session
    "s.rm")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            screen -S "$firstParameter" -X quit
        else
            echo "Please specify your session name you want to kill"
        fi
    ;;

    "s.rm.all")
        screen -ls | grep tach | cut -d. -f1 | awk '{print $1}' | xargs kill
    ;;

    "s.div.h")
        screen -S $STY -X split -v
        screen -S $STY -X focus
        screen -S $STY -X screen
    ;;

    "s.div.v")
        screen -S $STY -X split -h
        screen -S $STY -X focus
        screen -S $STY -X screen
    ;;

    "s.go.left" | "sl")
        screen -S $STY -X focus left
    ;;

    "s.go.right" | "sr")
        screen -S $STY -X focus right
    ;;

    "s.go.up" | "su")
        screen -S $STY -X focus up
    ;;

    "s.go.down" | "sd")
        screen -S $STY -X focus down
    ;;

    "spx")
        screen -S $STY -X remove
    ;;

    "s.re.left" | "srl")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            screen -S $STY -X resize -h $firstParameter
        else
            screen -S $STY -X resize -h +10
        fi
    ;;

    "s.re.right" | "srr")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            screen -S $STY -X resize -h $firstParameter
        else
            screen -S $STY -X resize -h -10
        fi
    ;;

    "s.re.up" | "sru")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            screen -S $STY -X resize -v $firstParameter
        else
            screen -S $STY -X resize -v +10
        fi
    ;;

    "s.re.down" | "srd")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            screen -S $STY -X resize -v $firstParameter
        else
            screen -S $STY -X resize -v -10
        fi
    ;;

    # attach/create a tmux session
    "t.at")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            tmux new -s "$firstParameter" \; split-window -v -l 20% \; select-pane -t 0
        else
            tmux new-session \; split-window -v -l 20% \; select-pane -t 0
        fi
    ;;

    "t.ls")
        tmux ls
    ;;

    "t.de")
        tmux detach
    ;;

    "t.re")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            tmux attach -t "$firstParameter"
        else
            echo "Please specify which session you want to detach"
        fi
    ;;

    "t.rm")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            tmux kill-session -t "$firstParameter"
        else
            echo "Please specify which session to kill"
        fi
    ;;

    "t.rm.all")
        for sess in $(tmux ls | awk '{FS=":" ; print $1}' | sed 's/://g') ; do tmux kill-session -t $sess ; done
    ;;

    "t.div.h")
        tmux split-window -h
    ;;

    "t.div.v")
        tmux split-window -v
    ;;

    "tpx")
        tmux kill-pane
    ;;

esac
