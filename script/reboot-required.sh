#!/bin/bash

#The file to be checked
FILECHECKED=/var/run/reboot-required

#---do not insert things from here..
/usr/bin/stat $FILECHECKED > /dev/null 2>&1
if [ $? -eq 0 ]
#...to  here-----#
	then
		echo Reboot required at least since $(/usr/bin/stat $FILECHECKED | grep Modify | cut -d ":" -f2-3)
		exit 1
	else
		echo "No reboot required or file not found"
		exit 0
fi
# As usual, we should never get there, but who knows?
exit 128
