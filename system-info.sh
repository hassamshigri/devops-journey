#!/bin/bash
echo "====== SYSTEM INFO MENU ======"
echo "1) Hostname"
echo "2) Username"
echo "3) IP Address"
echo "4) RAM Usage"
echo "5) Disk Usage"
read -p "Enter choice [1-5] " choice
case $choice in
1) 
echo "Hostname: $(hostname)"
;;
2)
echo "Username: $(whoami)"
;;
3)
echo "IP Address: $(ip addr show | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}')"
;;
4)
echo "RAM Usage: $(free -h | grep Mem | awk '{print $3 "/" $2}')"
;;
5)
echo "Disk Usage: $(df -h / | grep / | awk '{print $3 "/" $2}')"
;;
*)
echo "Invalid choice"
exit 1
;;
esac

exit 0
