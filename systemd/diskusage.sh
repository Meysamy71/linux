#!/bin/bash

DF=`df -lh | awk '/\/dev\/mapper\/rl-root/' | tr -s ' ' | cut -f 5 -d ' ' | tr -d -c 0-9`

if [ $DF -gt 80 ]
then
        echo "Partition Root Is: $DF% !!!"
        echo "Partition Root Going Full... Root Is: $DF%" | mail -s "Disk Usage" james@example.com
else
        echo "Partition Root Is: $DF%"
fi

