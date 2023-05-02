#!/bin/bash

echo ./send {contact} {string}

if [[ $1 == "-r" ]]
then
nc -lvnp 4444
elif [[ $1 == "--add-contact" ]]
then
name=$2
ip=$3
echo $name:$ip >> contacts
elif [[ $1 == "contacts" ]]
then
cat contacts
else
contact=$1
string=$2
ip=$(grep $contact contacts | perl -pe "s/.*://")
echo $string | nc $ip 4444 &
sleep 1 && exit 1
fi
