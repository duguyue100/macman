#!/bin/sh

# functions that brought by external tools

# convert pdf to html
case "$fn" in
    "pdf.html")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            pdf2htmlEX $firstParameter
        else
            echo "Please specify a valid PDF file"
        fi
    ;;

    # weather from command line
    "wttr")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            curl wttr\.in/$firstParameter
        else
            curl wttr\.in
        fi
    ;;

    ## print top10 used commands
    "top10")
        echo "Top10 Used Commands"
        HISTFILE=$HOME/.bash_history
        set -o history
        history | awk '{print $2}' | awk 'BEGIN {FS="|"}{print $1}' | sort | uniq -c | sort -nr | head
    ;;

    "starwar")
        telnet towel.blinkenlights.nl
    ;;

    # The Google Calendar functions needs gcalcli
    "cal")
        gcalcli agenda
    ;;

    "cal.week")
        gcalcli calw
    ;;

    "cal.mon")
        gcalcli calm
    ;;

    "cal.add")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            gcalcli quick "$firstParameter"
        else
            echo "Please specify a valid reminder entry"
            echo "e.g. 16:42 this is a message."
        fi
    ;;

    "say")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            say $firstParameter
        else
            echo "Please specify a valid string query"
        fi
    ;;

    # Open Gmail
    "mail")
        open https://mail.google.com/
    ;;

    "compose")
        open https://mail.google.com/mail/#compose
    ;;

    "compute")
        bc
    ;;

    "define")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            open dict://$firstParameter
        else
            echo "Please specify the word you want to define"
        fi
    ;;

    # Open Overleaf project
    "ol.open")
        git_remote=`git config --get remote.origin.url`
        open "${git_remote/git/www}"
    ;;

esac
