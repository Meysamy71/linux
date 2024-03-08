#!/bin/bash

ping -c 1 google.com >> /dev/null 2> /dev/null

if [ $? -eq 0 ]
then
        echo "Internet is Connected"
        sleep 2
else
        echo "Internet is Disconnected"
        sleep 2
fi

