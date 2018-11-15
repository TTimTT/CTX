#!/usr/bin/env bash

STARTING=$PWD

for directory in $(find $STARTING -type d); 
do
	cd "$directory"
	url=$(cat *.html* | grep "canonical*"  | sed "s/.*href=\"//" | sed "s/\" \/>/?page=/")
	$STARTING/./crawling.sh $url 1000
	cd $STARTING
done
