#!/bin/bash

resettem=$(tput sgr0)
                    #设置最后命令行的颜色
declare -A ssharray
                    #声明数组
i=0   
                    #设置循环基数
num=""

for Script_file in `ls -I "monitor_man.sh" ./` #输出除了这个执行文件的参数
    do
           echo -e "\e[1;34m" "The Script:" $i'==>'$resettem $Script_file	          
           grep -E "\#Program Function" ${Script_file}
           ssharray[$i]=$Script_file
	   num="$num | $i"
	   i=$((i+1))
    done
while [ true ]
    do
          read -t 30 -p "Please make a choice from three numbers:[ $num ] :" nummber
	  if [ -n "$nummber" ];then
	     tes=$(echo $nummber| sed 's/[0-2]//g')
	     if [ -z "$tes" ];then
	         sh ${ssharray[$nummber]}
		 else
                   echo -e "\e[1;31m" "Error:input words must be number and in 0-2." $resettem
		   exit 300
	     fi
	  else
	    echo -e "\e[1;31m" "Error:input words is null or don't have the file" $resettem
            exit 301
	 fi
    done
