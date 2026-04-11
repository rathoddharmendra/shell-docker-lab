#!/bin/bash
# Author: Dee
# Date: 04.04.2026
# Description: Takes multiple IPs or FQDNs from a file, and prints ping status


df -h | awk '0+$5 >= 60 {print}' 