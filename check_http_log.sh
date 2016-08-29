#!bin/bash
#Program Function:Apache's log analysis
resetrem=$(tput sgr0)
#reset the color of `ls` 

access_log='/var/log/httpd/access_log-*'
#the address of http_access_log


#check the status of http above 200-500
check_http_status(){
  httpstat=(`cat ${access_log}|grep -ioE "HTTP\/1.1\"[[:blank:]][0-9]{3}"|awk -F"[ ]+" '{
		    if ( $2>=100 && $2<200 )
		       {i++}
		    else if($2>=200 && $2<300)
		       {j++}
		    else if($2>=300 && $2<400)
		       {k++}
		    else if($2>=400 && $2<500)
		       {l++}
		    else if($2>=500)
		       {n++}
		 }END{
		    print i?i:0,j?j:0,k?k:0,l?l:0,n?n:0,i+j+k+l+n
		 }'`)
  echo '---------------http_status---------------------'
  echo -e "\e[1;33m" 'The number of http_status [100+]:' ${resetrem} ${httpstat[0]}
  echo -e "\e[1;33m" 'The number of http_status [200+]:' ${resetrem} ${httpstat[1]}
  echo -e "\e[1;33m" 'The number of http_status [300+]:' ${resetrem} ${httpstat[2]}
  echo -e "\e[1;33m" 'The number of http_status [400+]:' ${resetrem} ${httpstat[3]}
  echo -e "\e[1;33m" 'The number of http_status [500+]:' ${resetrem} ${httpstat[4]}
  echo -e "\e[1;33m" 'ALL of the http_status:' ${resetrem} ${httpstat[5]}
}

check_http_cod(){
        httpcode=(`cat ${access_log}|grep -ioE "HTTP\/1.1\"[[:blank:]][0-9]{3}"|awk -F"[ ]+" '{
			if ( $2!="" )
			    {cen[$2]++;total++}
			else
			    echo "Error"
			}END{
			    print cen[404]?cen[404]:0,cen[403]?cen[403]:0,total
			}'
			`)
  echo "---------------http_code----------------------"
  echo -e "\e[1;33m" 'The number of http_code [403]:' ${resetrem} ${httpcode[1]}
  echo -e "\e[1;33m" 'The number of http_code [404]:' ${resetrem} ${httpcode[0]}
  echo -e "\e[1;33m" 'All of the http_code numbers:'${resetrem} ${httpcode[2]}
}
check_http_status
check_http_cod
