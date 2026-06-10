#!/bin/bash
echo "SYSTEM INFORMATION" 
echo "------------------"
echo "Hostname: $(hostname)"
echo "Username: $(whoami)"
echo "IP Address: $(ip addr show | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}')"
echo "Memory Usage:$(free -h | grep Mem | awk '{print $3 "/" $2}')"
echo "Disk Usage:$(df -h / | grep / | awk '{print $3 "/" $2}')"


figlet I CAN WRITE THIS SHIT. 
