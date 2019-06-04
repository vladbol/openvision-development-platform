#!/usr/bin/sh
if [ $(date +%Y) -lt 2018 ]
then
	echo "Current year: $(date +%Y) older than 2018 !"
	echo "Trying to set correct date/time with a maximum timeout of 5 seconds..."
	ntpdate -t5 pool.ntp.org
fi
