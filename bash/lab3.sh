#!/bin/bash

# 1. Checking if the container already exists or installing it
snap list | grep -w lxd 
if test $? -eq 0; then
	echo "Programmer ======== Container already exists" ;
else
	echo "Programmer ======== Installing lxd"
	sudo apt install lxd
	echo "Programmer ======== lxd successfully installed"
	fi

# 2. Initializing LXD 
ip a | grep -q lxdbr0 
if [ $? -eq 0 ]; then
echo "Programmer ======== lxd is running"

else
	echo "Programmer ======== lxd nitializing..."
	lxd init auto
	fi

# Creating container
if lxc list | grep -q 'COMP2101-S22 | running'; 
	then echo "Programmer ======== COMP2101-S22 & IP associated are present" ;

else
    IPaddress=$(lxc info COMP2101-S22 | grep inet: | grep global | awk '{print $2}') 
	echo "Programmer ======== COMP2101-S22 and $IPaddress successfully added."
	fi

# installing software in container
lxc exec COMP2101-S22 -- dpkg --get-selections | grep -q apache
if [ $? -eq 0 ]; 
	then echo "Programmer ======== Apache already exists"
else
	echo "Programmer ======== Apache Installing now..."
	lxc exec COMP2101-S22 -- apt install apache2
	echo "Programmer ======== Apache successfully installed."
fi

# testing web service
curl -s http://google.com
if [ $? -eq 1 ]; 
then 
	echo "Programmer ======== Curl Installing now."
	lxc exec COMP2101-S22 -- sudo apt install curl ;
	
else
	echo "Programmer ======== Curl is already installed."
	fi
	
# get webpage
curl http://zonzorp.net && echo "Programmer ======== Successfully retrieved Webpage!" ||
echo "Programmer ======== Failed to retrieve Webpage!";

exit
