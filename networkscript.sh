

#!/bin/bash

#Brian hartford
# 12/8/2020
#This script dumps some network info to standard output as well as a log file.


#Run this script from the home directory, log files will be created here as well.
# I chose to include the commands "ifconfig"and "nmap" as well as search for the nameserver
# These are helpful in determining the ip address, scanning for open ports and determining which dns server you are using.



#Assigning the date to a variable in our script, so that we can output to one consistent timestamped file.

now=$(date)

#create log file
touch $now.log


# using ifconfig to get ip address, providing output to the console and our log file
echo To find ip address, we use ifconfig or ip addr >> $now.log
ifconfig >> $now.log

# echoing ifconfig info to stdout
echo To find ip address, we use ifconfig or ip addr
echo
ifconfig
echo 
echo

#Directing info about where our dns server is located to our log file
echo "To find DNS info we look in the /etc/resolv.conf directory" >> $now.log
echo "Our DNS server is located at" >> $now.log
echo "To find DNS info we look in the /etc/resolv.conf directory"

#Reading the resolv.conf file and printing the nameserver line, both to stdout and our log file
cat /etc/resolv.conf | grep "nameserver" 
cat /etc/resolv.conf | grep "nameserver" >> $now.log

echo
echo

#Using nmap to scan for open ports on our machine, directing output to stdout and our log file
echo "We can use nmap to scan for open ports on our machine" >> $now.log
nmap -p- localhost >> $now.log
echo "We can use namp to scan for open ports on our machine" 
nmap -p- localhost
#Adding some extra blank lines and displaying a message about where to find the log file
echo 
echo
echo Sending output to $now.log



