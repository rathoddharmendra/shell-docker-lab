#!/bin/bash

# Author: Dee
# Date: 14.03.2026

# Description: Playing with loops, and various ways to use them

# Define Variables
cont=0
    for i in 1 2 3 4 5
    # for i in eat sleep relax workout
    # for i in {1..5}
    do
        # $cont+=$i
        # echo $i and $((cont+10))
        echo >> null
    done

    for username in `awk -F: '{print $1}' /etc/passwd`
    do
        echo $((cont++)):$username
        echo $((cont++)):$username >> users_list.txt
    done


# for ((i=0;i<$file_count;i++))
# do
#     do something
# done