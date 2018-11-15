#!/usr/bin/env bash

STARTING=$PWD
TMP_FILE="tmp.html"
DATA_FILE="data.csv"
URL_LISTS="urls.txt"

for directory in $(find $STARTING -type d); 
do
	cd "$directory"
	for url in $(cat $URL_LISTS)
	do
		#################################### Downloading
		wget \
			--wait=10 \
			--random-wait \
			--reject '*.js,*.css,*.ico,*.gif,*.jpg,*.jpeg,*.png,*.mp3,*.pdf,*.tgz,*.flv,*.avi,*.mpeg,*.iso' \
			--execute robots=off \
			--user-agent=AGENT \
			--convert-links \
			--no-cache \
			--no-clobber \
			--no-http-keep-alive \
			--output-document="$TMP_FILE" \
			"$url"

		#################################### napping
		sleep 5
		#################################### Parsing
		# Main info -> inggredients
		hash=$(md5sum $TMP_FILE | sed "s/  $TMP_FILE.*//")
		title=$(cat $TMP_FILE | grep "<title>" | sed "s/.*<title>//" | sed "s/Recipe - Allrecipes.*//")
		ing=$(cat $TMP_FILE | grep "checkList__item'\}\[true\]" | sed "s/.*title=\"//" | sed "s/\">//" | tr "\r" " " | tr "\n" "|")

		# Nutritive
		nutritive=$(cat $TMP_FILE | grep -A 20 "<div class=\"nutrition-summary-facts\">" | grep "itemprop")

		# Calories values
		cal=$(echo "$nutritive" | grep "calorie*" | sed 's/<span itemprop=\"calories\">//' | sed "s/ calories;<\/span.*//" | sed 's/[[:blank:]]//g' | sed ':a;N;$!ba;s/\n//g')

		# Fat values
		fat=$(echo "$nutritive" |grep "fat*")
		val=$(echo "$fat" | sed 's/<span itemprop=\"fatContent\">//' | sed "s/<span.*//" | sed 's/[[:blank:]]//g' | sed ':a;N;$!ba;s/\n//g')
		if [[ $val ]]
		then
			if [[ $(echo "$fat" | sed "s/.*hidden=\"true\">//" | grep "mg") ]]
			then
				fat=$val
			else
				fat=$(echo $val*1000 | bc)
			fi
		fi

		# Carbon values
		carb=$(echo "$nutritive" |grep "carbon*")
		val=$(echo "$carb" | sed 's/<span itemprop=\"carbohydrateContent\">//' | sed "s/<span.*//" | sed 's/[[:blank:]]//g' | sed ':a;N;$!ba;s/\n//g')
		if [[ $val ]]
		then
			if [[ $(echo "$carb" | sed "s/.*hidden=\"true\">//" | grep "mg") ]]
			then
				carb=$val
			else
				carb=$(echo $val*1000 | bc)
			fi
		fi

		# Protein values
		prot=$(echo "$nutritive" |grep "prot*")
		val=$(echo "$prot" | sed 's/<span itemprop=\"proteinContent\">//' | sed "s/<span.*//" | sed 's/[[:blank:]]//g' | sed ':a;N;$!ba;s/\n//g')
		if [[ $val ]]
		then
			if [[ $(echo "$prot" | sed "s/.*hidden=\"true\">//" | grep "mg") ]]
			then
				prot=$val
			else
				prot=$(echo $val*1000 | bc)
			fi
		fi

		# Cholesterol values
		chol=$(echo "$nutritive" |grep "chol*")
		val=$(echo "$chol" | sed 's/<span itemprop=\"cholesterolContent\">//' | sed "s/<span.*//" | sed 's/[[:blank:]]//g' | sed ':a;N;$!ba;s/\n//g')
		if [[ $val ]]
		then
			if [[ $(echo "$chol" | sed "s/.*hidden=\"true\">//" | grep "mg") ]]
			then
				chol=$val
			else
				chol=$(echo $val*1000 | bc)
			fi
		fi

		# Sodium values
		sod=$(echo "$nutritive" |grep "sodium*")
		val=$(echo "$sod" | sed 's/<span itemprop=\"sodiumContent\">//' | sed "s/<span.*//" | sed 's/[[:blank:]]//g' | sed ':a;N;$!ba;s/\n//g')
		if [[ $val ]]
		then
			if [[ $(echo "$sod" | sed "s/.*hidden=\"true\">//" | grep "mg") ]]
			then
				sod=$val
			else
				sod=$(echo $val*1000 | bc)
			fi
		fi
		######################################### Printout
		echo -e "$hash\t${PWD##*/}\t$title\t$ing\t$cal\t$carb\t$fat\t$prot\t$sod\t$chol" >> "$DATA_FILE"
	######################################### end for URLS
	done 
	######################################### Cleaning??
	cd $STARTING
done
