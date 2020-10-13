#!/bin/bash 

TESTFILE=TLTest.txt


function tltest {
	# Check for directory for if Truelayer exists and if truelayer doesn't exists then make directory.
	if [ -d "./Truelayer" ]
	then 
	echo "Directory Truelayer exists."
	else 
	mkdir -p Truelayer
	fi 
	# Creates test file (TLTest.txt)
	cd Truelayer; touch $TESTFILE
	CWD="$(pwd)"
	# Get time,file,IP,Memory,Process ID and User name.

	TIME=`date '+%Y-%m-%d %H:%M:%S'`
	FILE=`find . -name '*' | sed 's/\.\///g'`
	IPADDR=`curl -s checkip.amazonaws.com`
	MEMORY=`top -l 1 | grep PhysMem: | awk '{print $2}'`
	PID=`echo $$`
	WHOAMI=`whoami`

	# Redirect all outputs to test file.   
	echo -e ${TIME}'\t'${FILE}'\t'${IPADDR}'\t'${MEMORY}'\t'${PID}'\t'${WHOAMI}'\n' >> $CWD/$TESTFILE
	# Redirect file list to test file.

	ls -la $CWD >> $CWD/$TESTFILE


}


# Call main function.
tltest
