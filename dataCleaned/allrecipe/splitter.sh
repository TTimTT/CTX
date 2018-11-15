#!/usr/bin/env bash

STARTING=$PWD

for directory in $(find $STARTING -type d); 
do
	cd "$directory"
	#url=$(cat *.html* | grep "canonical*"  | sed "s/.*href=\"//" | sed "s/\" \/>/?page=/")
	url=$(cat index.html\?page\=* | grep -A 3 "<article class=\"fixed-recipe-card\">" | grep "href" | sed "s/<a href=\"//" | sed "s/\" data.*//")
	echo "$url" > "urls.txt"
	#$STARTING/./crawling.sh $url 1000
	cd $STARTING
done
