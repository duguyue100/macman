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
    ;;

    "g.conf")
        git config --list
    ;;

    # undo commit
    "g.undo")
        git reset --soft HEAD~
    ;;

    "g.push")
        curr_bh=`git rev-parse --abbrev-ref HEAD`
        git push origin ${curr_bh}
    ;;

    "g.pull")
        curr_bh=`git rev-parse --abbrev-ref HEAD`
        git pull origin ${curr_bh}
    ;;

    "g.merge")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            git merge $firstParameter
        else
            echo "Please specify the name of the branch you want to merge"
        fi
    ;;

    # create branch
    "g.th.bh")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            git checkout -b $firstParameter
        else
            echo "Please specify the name of the branch"
        fi
    ;;

    # clone remote branch to local
    "g.th.re.bh")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            git checkout -b $firstParameter origin/$firstParameter
        else
            echo "Please specify the name of the remote branch you want to clone"
        fi
    ;;

    # check out remote branch
    "g.co.re.bh")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            git checkout origin/$firstParameter
        else
            echo "Please specify the name of the remote branch you want to check out."
        fi
    ;;

    "g.co.bh")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            git checkout $firstParameter
        else
            echo "Please specify a valid name of the branch you want to checkout"
        fi
    ;;

    # list branch
    "g.ls.bh")
        git branch -a
    ;;

    # remove local branch
    "g.rm.bh")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
             git branch -d $firstParameter
        else
            echo "Please specify the name of the branch you want to remove"
        fi
    ;;

    # remove local and remote branch
    "g.rm.re.bh")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            git branch -d $firstParameter
            git push origin --delete $firstParameter
        else
            echo "Please specify the name of the branch you want to remove from local and remote"
        fi
    ;;

esac
