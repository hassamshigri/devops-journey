#!/bin/bash
echo "System Information"
echo "============"
echo "Hostname: $(hostname)"
echo "User: $(whoami)"
echo "Date: $(date)"
echo "IP Address: $(ip addr show | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}')"
echo "RAM Usage: $(free -h | grep Mem | awk '{print $3 "/" $2}')"
echo "Disk Usage: $(df -h / | grep / | awk '{print $3 "/" $2}')"
