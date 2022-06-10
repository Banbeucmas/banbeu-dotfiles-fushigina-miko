#!/bin/sh

# Example of how you can parse this in a shorter form
while read -r lang; do
    case $lang in 
        "Bamboo")
            echo "vn"
            ;;
        "xkb:us::eng")
            echo "en"
            ;;
        "mozc-jp")
            echo "jp"
            ;;
        *)
            echo $lang
            ;;
    esac
done