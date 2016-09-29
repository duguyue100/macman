#!/bin/sh

# Utitlies for compressors

case "$fn" in
    # list all files in a ZIP archive
    "lszip")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            unzip -l $firstParameter
        else
            echo "Please give a valid ZIP archive to list."
        fi
    ;;

    # unzip a file at current folder or to a chosen folder
    "unzip")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            if [ ! -z "$secondParameter" -a "$secondParameter" != " " ]; then
                unzip $firstParameter -d $secondParameter
            else
                unzip $firstParameter
            fi
        else
            echo "Please give a valid ZIP archive to unzip."
        fi
    ;;

    # zip a file or a folder
    "zip")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            zip -r -X $firstParameter.zip $firstParameter
        else
            echo "Please give a valid folder to zip"
        fi
    ;;

    "untar")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            if [ ! -z "$secondParameter" -a "$secondParameter" != " " ]; then
                tar -xvzf $firstParameter -C $secondParameter
            else
                tar -xvzf $firstParameter
            fi
        else
            echo "Please specify a tar.gz/tgz file to extract."
        fi
    ;;

    "tar")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            tar -zcvf $firstParameter.tar.gz $firstParameter
        else
            echo "Please specify a file/folder for compress."
        fi
    ;;

    "lstar")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            tar -tvf $firstParameter
        else
            echo "Please specify a tar.gz for list."
        fi
    ;;

esac
