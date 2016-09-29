#!/bin/sh

# Some functions related to some Git routines.

case "$fn" in
    "g.log")
        git log --pretty=oneline
    ;;

    "g.stat")
        git status
    ;;

    "g.open")
         open `git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#http://#' -e 's@com:@com/@'`| head -n1
    ;;

    "g.size")
        git bundle create tmp.bundle --all
        echo "\n\nCurrent Git repository size: "
        du -sh tmp.bundle
        rm tmp.bundle
    ;;

    # add remote origin
    "g.add")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            git remote add origin $firstParameter
        else
            echo "Please specify a valid remote address"
        fi

    "g.conf")
        git config --list
    # undo commit
    "g.undo")
        git reset --soft HEAD~

    # create branch
    "g.th.branch")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            git checkout -b $firstParameter
        else
            echo "Please specify the name of the branch"
        fi

    # list branch
    "g.ls.branch")
        git branch -a

    # remove local branch
    "g.rm.branch")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
             git branch -d $firstParameter
        else
            echo "Please specify the name of the branch you want to remove"
        fi

    # remove local and remote branch
    "g.rm.branch.remote")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            git branch -d $firstParameter
            git push origin --delete $firstParameter
        else
            echo "Please specify the name of the branch you want to remove from local and remote"
        fi

esac
