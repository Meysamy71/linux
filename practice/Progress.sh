#!/bin/bash

progress()
{
        echo -n "Pealse wait..."
        while true
        do
                echo -n "."
                sleep 1
        done
}

progress &

MYSELFID=$!

sleep 10

kill $MYSELFID >/dev/null 2>&1

echo -e "\n Done!"
