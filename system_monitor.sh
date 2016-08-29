#!/bin/bash
#Program Function:A shell work for geting network,disk usage,uptime And RAM Usage in linux 
		
resetrem=$(tput sgr0)


echo -e "\e[1;35m"  $resetrem

#OS type
OStype=$(uname -o)
echo -e "\e[1;36m" 'OStype:' $resetrem ${OStype}

#OS version
OSversion=$(cat /etc/centos-release)
echo -e "\e[1;36m" 'OSversion:' $resetrem ${OSversion}
 

#OS archtecher
OSarchtecher=$(uname -i)
echo -e "\e[1;36m" 'OSarchtecher:' $resetrem ${OSarchtecher}

#Kernal rlease
Kernal=$(uname -r)
echo -e "\e[1;36m" 'Kernal:' $resetrem ${Kernal}

#hostname
hostname=$(hostname)
echo -e "\e[1;36m" 'hostname:' $resetrem ${hostname}

#Internal IP
Internalip=$(hostname -I)
echo -e "\e[1;36m" 'Internalip:' $resetrem ${Internalip}

#External IP
Externalip=$(curl -s http://ipecho.net/plain)
echo -e "\e[1;36m" 'Externalip:' $resetrem ${Externalip}

#DNS
DNS=$(cat /etc/resolv.conf | grep nameserver|cut -d " " -f 2)
echo -e "\e[1;36m" 'DNS:' $resetrem ${DNS}

#check connect to internet
ConnectInternet=$(ping -c 2 www.baidu.com&>/dev/null && echo 'yes' || echo 'no')
echo -e "\e[1;36m" 'ConnectInternet:' $resetrem ${ConnectInternet}

#check user logged  users
loggedUser=$( who | awk '{print $1}')
echo -e "\e[1;36m" 'loggedUser:' $resetrem ${loggedUser}
