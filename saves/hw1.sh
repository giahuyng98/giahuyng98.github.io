#!/bin/bash

url=''
file='tmp'
option=0

function menu()
{
    clear
    while true;
    do
        echo "================================="
        echo "URL = $url"
        echo "File = $file"
        echo "================================="
        echo "1. Change url"
        echo "2. Change file"
        echo "3. Download content"
        echo "4. Count lines"
        echo "5. Count word"
        echo "6. Count word (input)"
        echo "7. Replace word"
        echo "0. Exit"

        read -p "Enter option: " option

        #if [[ $option -eq 0 ]]; then
        #    exit 0
        #fi

        case $option in
            0)
                exit 0
                ;;
            1)
                read -p "Enter new url: " url
                ;;
            2)
                read -p "Enter new file name: " file
                ;;
            3)
                curl -o $file $url
                echo "Download completed"
                ;;
            4)
                echo "File '$file' has: $(wc $file | awk '{print $1}') line(s)."
                ;;
            5)
                echo "File '$file' has: $(wc $file | awk '{print $2}') word(s)."
                ;;
            6)
                read -p "Enter word to search: " word
                echo "File '$file' has $(grep $word -F $file -o -w | wc -l) occurrence(s) of string '$word'"
                ;;
            7)
                read -p "Enter old word need to be replace: " old
                read -p "Enter new word: " new
                read -p "Enter file name: " newfile
                echo "Run command: sed 's/$old/$new/g' $file > $newfile"
                sed 's/$old/$new/g' $file > $newfile
                ;;
        esac
    done
}

#VOID MAIN
menu
