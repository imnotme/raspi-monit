#!/bin/bash

SMARTSTATE=$(/usr/sbin/smartctl -a /dev/sda -d sat | grep -A1 "SMART Error Log" | tail -n1)

echo $SMARTSTATE

if [[ $SMARTSTATE == "No Errors Logged" ]]
	then exit 0
	else exit 1
fi
exit 128
