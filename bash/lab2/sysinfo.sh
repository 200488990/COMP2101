#!/bin/bash

# VARIABLES REQUIRED
domainName=$(hostname --fqdn)                                   # domain name
osInformation=$(hostnamectl | grep -h "Operating System")       # os information
ipAddress=$(hostname -i)                                        # ip address
spaceLeft=$(df -h / | grep "dev/sda" | awk '{print $4}')        # storage space left

# OUTPUT
echo "Report for myvm"
echo "==============="
echo "FQDN: $domainName"
echo "Operating System name and version: $osInformation"
echo "IP Address: $ipAddress" 
echo "Root Filesystem Free Space: $spaceLeft"
echo "==============="