#!/bin/bash

clear

PASS=`tr -dc 'a-zA-Z0-9!@#$%^&*()_+~][}{?></";.,[]=-' < /dev/urandom | fold -w 32 | head -n1`

echo "Your Passord is: $PASS"

