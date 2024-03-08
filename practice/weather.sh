#!/bin/bash

clear

read -p "Please enter your city: " CITY

curl wttr.in/$CITY?mn1
