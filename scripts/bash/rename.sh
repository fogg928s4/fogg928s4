#!/bin/bash

FOLDER=$1
BASE_FILE_NAME=$2
NEW_FILE_NAME=$3

pushd $FOLDER
ls -1 | while read line;
do
	EXTENSION="`echo $line | cut -d\. -f2`"
	
	mv "${BASE_FILE_NAME}.${EXTENSION}" "${NEW_FILE_NAME}.${EXTENSION}"
done
popd
