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

    # Use Google Maps to search query
    "maps")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            open https://maps.google.com/?q="$firstParameter"
        else
            echo "Please specify a search query"
        fi
    ;;

    "compute")
        bc
    ;;

    "define")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            open dict://"$firstParameter"
        else
            echo "Please specify the word you want to define"
        fi
    ;;

    # Open Overleaf project
    "ol.open"|"olgo")
        git_remote=`git config --get remote.origin.url`
        open "${git_remote/git/www}"
    ;;

    # add template Python makefiles to the directory
    "pymake")
        cp $MAC/res/pyMakefile $PWD/Makefile
    ;; 

    "imshow")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            $MAC/res/imgcat $firstParameter
        else
            echo "Please specify the image you want to show."
        fi
    ;;

    "ascii")
        man ascii
    ;;

    "vim")
        open http://vim.rtorr.com/
    ;;

    # code search
    "ag")
        ag $allParameters
    ;;

    # return a cat GIF in iTerm
    "cat")
        wget -q "http://thecatapi.com/api/images/get?format=src&type=gif" -O /tmp/cat.gif
        $MAC/res/imgcat /tmp/cat.gif
        rm /tmp/cat.gif
    ;;

    # start a simple HTTP server with python
    "share")
        cp $MAC/res/share.md $SHARE_PATH
        local_ip=$(ipconfig getifaddr en0)
        if [ $? != 0 ]; then
            local_ip=$(ipconfig getifaddr en1)
        fi
        sed -i "" "s/toreplace/$local_ip/g" $SHARE_PATH/share.md
        cd $SHARE_PATH
        git pull origin master
        git add $SHARE_PATH/share.md
        git commit -m "update share.md"
        git push origin master
        pushd $HOME/share;
        python -m SimpleHTTPServer;
        popd
    ;;

    # check WAKA status
    "waka")
        open https://wakatime.com/dashboard 
    ;;

    # edit from macdown
    "md")
        macdown $allParameters
    ;;
esac
