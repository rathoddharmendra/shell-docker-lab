#!/bin/bash

# Author: Dee
# Date: 04.04.2026
# Description: Show system error messages from Ubuntu server syslog file

data='data/syslog'

grep -i "error" "$data"

