#!/bin/bash

TH=80
USAGE=`df -h / |awk 'NR==2 {print $5}'|cut -d "%" -f 1`

if [[ USAGE -gt TH ]]
then
	echo "Disk usage is above $TH% the / is $USAGE%"
else
	echo "Disk usage is above $TH% the / is $USAGE%"
fi
