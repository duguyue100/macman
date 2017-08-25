#!/bin/sh

case "$fn" in
    "d.build")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            docker build $allParameters
        else
            echo "Please specify a PATH or URL."
        fi
    ;;

    "d.ls.con")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            docker ps $allParameters
        else
            docker ps
        fi
    ;;

    "d.ls.all.con")
        docker ps -a
    ;;

    "d.ls.img")
        docker images -a
    ;;

    "d.start")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            docker start $allParameters
        else
            echo "Please specify a docker container name."
        fi
    ;;

    "d.kill")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            docker kill $allParameters
        else
            echo "Please specify a docker container name to kill."
        fi
    ;;

    "d.rm.img")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            docker rmi $allParameters
        else
            echo "Please specify a docker image name to remove"
        fi
    ;;

    "d.rm.con")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            docker rm $allParameters
        else
            echo "Please specify a docker container name to remove"
        fi
    ;;

    "d.pull")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            docker pull $allParameters
        else
            echo "Please specify a docker image to pull"
        fi
    ;;

    "d.push")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            docker push $allParameters
        else
            echo "Please specify a docker image to push"
        fi
    ;;

esac
