#!/bin/sh

# Some functions related to some Git routines.

case "$fn" in
    "g.log")
        git log --oneline | nl -v0 | sed 's/^ \+/&HEAD~/'
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
    "g.re")
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

    "g.init")
        git init
    ;;

    "g.clone")
        git clone "$allParameters"
    ;;

    "g.add")
        git add "$allParameters"
    ;;

    "g.add.all")
        git add -A
    ;;

    "g.commit")
        git commit -m "$firstParameter" -q
    ;;

    "g.ac")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            git add "$firstParameter"
        else
            echo "Please give a valid file name."
        fi
        if [ ! -z "$secondParameter" -a "$secondParameter" != " " ]; then
            git commit -m "$secondParameter"
        else
            echo "Please give a valid commit message"
        fi
    ;;

    "g.aca")
        git add -A
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            git commit -m "$firstParameter" -q
        else
            echo "Please give a valid commit message"
        fi
    ;;

    "g.acp")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            git add "$firstParameter"
        else
            echo "Please give a valid file name."
        fi
        if [ ! -z "$secondParameter" -a "$secondParameter" != " " ]; then
            git commit -m "$secondParameter"
        else
            echo "Please give a valid commit message"
        fi
        curr_bh=`git rev-parse --abbrev-ref HEAD`
        git push origin ${curr_bh}
    ;;

    "g.acap")
        git add -A
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            git commit -m "$firstParameter" -q
        else
            echo "Please give a valid commit message"
        fi
        curr_bh=`git rev-parse --abbrev-ref HEAD`
        git push origin ${curr_bh}
    ;;

    "g.mv")
        git mv "$allParameters"
    ;;

    "g.rm")
        git rm "$allParameters"
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

    "g.lfs.init")
        git lfs install
    ;;

    "g.lfs.tk")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            git lfs track "$firstParameter"
        else
            echo "Please specify the files you want to track"
        fi
    ;;

    "g.lfs.untk")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            git lfs untrack "$firstParameter"
        else
            echo "Please specify the files you want to untrack"
        fi
    ;;

    "g.lfs.ls")
        git lfs ls-files
    ;;

    "g.lfs.conf")
        git lfs env
    ;;

esac
