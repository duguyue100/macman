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

esac
