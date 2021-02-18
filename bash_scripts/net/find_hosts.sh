#!/bin/bash

sudo nmap -sP 192.168.0.1/24 | grep -B 2 --color "Intel\|Oracle"
