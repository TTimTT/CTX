#!/usr/bin/env sh

######################################################
# Extracts recipes origins from Allrecipes HTML pages,
######################################################

URL="https://www.allrecipes.com/recipes/"

FOLDER="."
RECIPE_PAGES_PATH="$FOLDER/recipePages"
RECIPE_LIST_FILE="$FOLDER/weight_uniqueRecipeUrls.tsv"

for gla in $(find -type f -name '*.html')
do
	if 	grep -qF "allrecipes.com" $gla; then

	fi
done
