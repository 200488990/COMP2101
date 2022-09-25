#!/bin/bash

# host name
mhost=hostname
echo "hostname: $mhost"
echo "---"
# hostname ctl
echo "host data:"
hostnamectl
echo "---"
# os name and version
osNameVersion=$(hostnamectl | grep -h "Operating System")
echo "$osNameVersion"
echo "---"
# ip addresses
echo "IP Address: "
ip a | grep -w inet
echo "---"
# storage space information
storageInfo=$(df | grep -h "/dev/")
echo "System Space Information:"
echo "$storageInfo"