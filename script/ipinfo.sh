#!/bin/bash
# exit
# 0 : Ok IP not changed
# 1 : New IP
# 2 : Error while getting new IP
# 3 : Optionnal, exit if new file have been created

IPFILE=/tmp/ipinfo.result
#HASHBIN=/usr/bin/md5sum

if [ ! -e $IPFILE ]
	then
		/usr/bin/curl http://ipinfo.io -o $IPFILE > /dev/null 2>&1
		echo -n "New IP temp file created | "
		#exit 3
fi


# Variable order IS important
OLDIP=$(/bin/cat $IPFILE)
NEWIP=$(/usr/bin/curl http://ipinfo.io/ip -o $IPFILE > /dev/null 2>&1; /bin/cat $IPFILE)
#OLDIPHASH=$($HASHBIN $OLDIP)
#NEWIPHASH=$($HASHBIN $OLDIP)

#Debug
#echo OLD : $OLDIP
#echo NEW : $NEWIP

if [ "$NEWIP" != "$OLDIP" ]
	then
		if [ -z "$NEWIP" ]
			then
				echo Error while getting new IP address
				exit 2
			else
				echo New IP address \: $NEWIP
				exit 1
		fi
	else
		echo $OLDIP
		exit 0
fi
# We should never get there
exit 128
