#!/usr/bin/env bash

STARTING=$PWD

for directory in $(find $STARTING -type d); 
do
	cd "$directory"
	url=$(cat *.html* | grep "canonical*"  | sed "s/.*href=\"//" | sed "s/\" \/>/?page=/")
	
	$STARTING/./crawling.sh $url 2
	sleep 5
	cd $STARTING
done
