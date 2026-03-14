#!/bin/bash

# Author: Dee
# Date: 12.03.2026

# Description: Checking Unix command utilities on dokken/centos-stream-9 sourced image

# Define Variables
p=pwd
d=date
l=ls
c='cal 2025'
h=`hostname`
u=$(uptime) #std definition - latest

echo -e "\n"

echo
$p
$l
$d
echo $c # doesn't work - echo reformats the print
$c

echo $h # define using literals to print with echo
echo $u

ls
echo
pwd
echo
hostname
echo
date
echo
cal
echo
whoami
echo
cat /etc/host.conf
echo
touch "newfile" 
rm "newfile"

# basic administrative tasks

echo 
top | head -10
echo

df -h
echo

free -m 
echo

uptime
echo


