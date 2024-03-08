#!/bin/bash
clear
echo -e "\e[1;31m-----> `date "+%F %T "`<-----\e[0m"
echo -e "\e[1;36m---> Process Manager <---\e[0m"
PS3="Please Enter Your Chois: "
select CHOISE in "Top 5 CPU Usage %" "CPU more: (Like more 5 Percentage)" "Memory More: (Like more 5 Percentage)" "Zombie Process" "Kill Process" "Kill All Zombie Process" "Exit";
do
	case $REPLY in
		1) 
			top -b -n1|head -12|tail -6
			;;
		2)
			read -p "Enter Your CPU %: " cpuUsage
			top -b -n1|sed '1,6d'|awk -v cpu=$cpuUsage, '{if ($9>=cpu) print $0}'
			;;
		3)
				
			read -p "Enter Your CPU %: " memUsage
			top -b -n1|sed '1,6d'|awk -v mem=$cpuUsage, '{if ($10>=mem) print $0}'
			;;
		4)
			echo "Zombie Process Run: "
			ps aux|awk '{print $8}'|grep -c "Z"
			echo "Zombie Process: "
			ps aux|awk '{print $2"|"$11"|"$8}'|grep -w "Z\|Z+"
			echo -e "\e[31mParent zombie Process: \e[0m"
			ps aux|awk '{print $2","$8}'|grep -w "Z\|Z+"|cut -f1 -d","|xargs -I pi pstree -p -s pi
			;;	
		5)
			read -p "Please enter PID: " pid
			kill -9 $pid
			;;
		6)
			
			ps aux|awk '{print $2","$8}'|grep -w "Z\|Z+"|cut -f1 -d","|xargs -I x pstree -p -s x|sed 's/---/,/g'|cut -f6 -d,|grep -P -o "\d{1,4}"|xargs -I p kill -9 p
			;;
		7)
			echo "GoodBye"
			exit
			;;	
		*)
			echo "Try Again"
			;;
	esac		


done	
