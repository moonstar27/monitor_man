#!/bin/bash
#Program Function:To check httpd and mysql's running
 
resetrem=$(tput sgr0)

url='http://192.168.255.150'

check_httpd_server(){

    response_code=$(curl -s -o /dev/null -w %{http_code} ${url})

    if [ "$response_code" -ge 500 -o "$response_code" -eq 000 ];then
        echo -e "\e[1;31m" 'Error:check http server now!!! response_code:' ${resetrem} ${response_code}
        read -t 30 -n 1 -p 'you need to restart the httpd.servce? [y/n]' answer
            if [ -n "$answer" ];then
	        tes=$(echo $answer| sed 's/[a-z]//g')
                if [ -z "$tes" -a "$answer" == 'y' ];then
                     systemctl restart httpd.service
                     echo -e "\e[1;32m" 'Success:Apache restart OK!!' ${resetrem}
	           else
	           echo -e "\e[1;31m" '31m Error:your input must make choice above this' ${resetrem}
	        fi
	      else
	      echo -e "\e[1;31m" 'Error:your input must not be null' ${resetrem}
	      exit 223
	   fi
    else 
       echo -e "\e[1;32m" 'Success:check http server pass response_code:' ${resetrem} ${response_code}
    fi
}

check_httpd_server
