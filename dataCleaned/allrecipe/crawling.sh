#!/usr/bin/env bash

for i in $(eval echo {1..$2})
do
 TARGET="${1/$'\r'/}$i"
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
	--follow-tags=a/href \
	--accept=html \
	--header="Accept: text/html" \
	--ignore-tags=img,link,script \
	$TARGET
done

#--reject-regex="/*index\.html\.*/" \
#https://www.allrecipes.com/recipes/86/world-cuisine
#--accept-regex="/.*\/recipes\/\d+\/world-cuisine\/.*|.*\/recipe\/\d+\/.*\//" \
#--accept-regex=".*\/recipes\/\d+\/cuisines-regions\/.*|.*\/recipe\/\d+\/.*\/" \
