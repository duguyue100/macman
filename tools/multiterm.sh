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
            echo "Please specify which session you want to detach"
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
            echo "Please specify your session name"
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

    # attach/create a tmux session
    "t.at")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            tmux new -s "$firstParameter"
        else
            tmux
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
        tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill
    ;;

    "t.div.h")
        tmux split-window -h
    ;;

    "t.div.v")
        tmux split-window -v
    ;;

    "t.go.left" | "tl")
        tmux select-pane -L
    ;;

    "t.go.right" | "tr")
        tmux select-pane -R
    ;;

    "t.go.up" | "tu")
        tmux select-pane -U
    ;;

    "t.go.down" | "td")
        tmux select-pane -D
    ;;

    "tpx")
        tmux kill-pane
    ;;

    "t.re.left" | "trl")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            tmux resize-pane -L $firstParameter
        else
            tmux resize-pane -L 15
        fi
    ;;

    "t.re.right" | "trr")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            tmux resize-pane -R $firstParameter
        else
            tmux resize-pane -R 15
        fi
    ;;

    "t.re.up" | "tru")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            tmux resize-pane -U $firstParameter
        else
            tmux resize-pane -U 15
        fi
    ;;

    "t.re.down" | "trd")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            tmux resize-pane -D $firstParameter
        else
            tmux resize-pane -D 15
        fi
    ;;

esac
