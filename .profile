#!/bin/sh

# apt-get install aptitude
# aptitude install xkbset
# xmodmap -pke
# xev
#numlockx on
sleep 5 && xkbset m &
sleep 5 && xkbset exp =m &
sleep 5 && xmodmap ~/.Xmodmap &

