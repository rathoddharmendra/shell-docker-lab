#!/bin/bash

# Author: Dee
# Date: 12.03.2026

# Description: Checking Unix command utilities on dokken/centos-stream-9 sourced image

# Define Variables

grep -i ASL "/scripts/scripts/system.log" > ./error-file.log #| awk -F: '{print $2}' 