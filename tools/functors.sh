#!/bin/sh

# functions that brought by external tools

# convert pdf to html
case "$fn" in
    # weather from command line
    "weather")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            curl wttr\.in/$firstParameter
        else
            curl wttr\.in
        fi
    ;;

    "starwar")
        telnet towel.blinkenlights.nl
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

    "ascii")
        man ascii
    ;;

    "vim")
        open http://vim.rtorr.com/
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
esac
