#!/bin/bash 

TESTFILE=TLTest.txt


function tltest {
	if [ -d "./Truelayer" ]
	then 
	echo "Directory Truelayer exists."
	else 
	mkdir -p Truelayer
	fi 
	cd Truelayer; touch $TESTFILE
	CWD="$(pwd)"

	TIME=`date '+%Y-%m-%d %H:%M:%S'`
	FILE=`find . -name '*' | sed 's/\.\///g'`
	IPADDR=`curl -s checkip.amazonaws.com`
#	MEMORY=`sysctl -a | grep mem |grep -i hw.memsize: | awk '{print $2}'`
	MEMORY=`top -l 1 | grep PhysMem: | awk '{print $2}'`
	PID=`echo $$`
	WHOAMI=`whoami`

	   
	echo -e ${TIME}'\t'${FILE}'\t'${IPADDR}'\t'${MEMORY}'\t'${PID}'\t'${WHOAMI}'\n' >> $CWD/$TESTFILE

	ls -la $CWD >> $CWD/$TESTFILE


}



tltest
