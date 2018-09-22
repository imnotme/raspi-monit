#! /bin/bash
TEMPERATURE=$(/opt/vc/bin/vcgencmd measure_temp | cut -d "=" -f2 | cut -d "'" -f1 | cut -d '.' -f1)

if [ $TEMPERATURE -gt 65 ]
	then 
		echo "$TEMPERATURE°C"
		exit 1
	else
		echo "$TEMPERATURE°C"
fi
exit 0
