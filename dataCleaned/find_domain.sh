#!/usr/bin/env sh

#########################################################################################
# Extracts domain sets from recipe HTML pages, using hand-crafted regular expressions
#########################################################################################

FOLDER="."
RECIPE_PAGES_PATH="$FOLDER/recipePages"
RECIPE_LIST_FILE="$FOLDER/weight_uniqueRecipeUrls.tsv"

for gla in $(find -type f -name '*.html')
do
	if 	grep -qF "allrecipes.com" $gla; then
   		echo "allrecipes.com" | cat - "$gla" > tmp && mv tmp "$gla"

	elif grep -qF "food.com" $gla; then
   		echo "food.com" | cat - "$gla" > tmp && mv tmp "$gla"

	elif grep -qF "yummly.com" $gla; then
   		echo "yummly.com" | cat - "$gla" > tmp && mv tmp "$gla"

	elif grep -qF "myrecipes.com" $gla; then
   		echo "myrecipes.com" | cat - "$gla" > tmp && mv tmp "$gla"

	elif grep -qF "recipes.sparkpeople.com" $gla; then
   		echo "recipes.sparkpeople.com" | cat - "$gla" > tmp && mv tmp "$gla"

	elif grep -qF "bettycrocker.com" $gla; then
   		echo "bettycrocker.com" | cat - "$gla" > tmp && mv tmp "$gla"

	elif grep -qF "foodnetwork.com" $gla; then
   		echo "foodnetwork.com" | cat - "$gla" > tmp && mv tmp "$gla"

	elif grep -qF "cdkitchen.com" $gla; then
   		echo "cdkitchen.com" | cat - "$gla" > tmp && mv tmp "$gla"

	elif grep -qF "eatingwell.com" $gla; then
   		echo "eatingwell.com" | cat - "$gla" > tmp && mv tmp "$gla"

	elif grep -qF "delish.com" $gla; then
   		echo "delish.com" | cat - "$gla" > tmp && mv tmp "$gla"

	elif grep -qF "cookeatshare.com" $gla; then
   		echo "cookeatshare.com" | cat - "$gla" > tmp && mv tmp "$gla"

	elif grep -qF "recipe.com" $gla; then
   		echo "recipe.com" | cat - "$gla" > tmp && mv tmp "$gla"

	elif grep -qF "kraftrecipes.com" $gla; then
   		echo "kraftrecipes.com" | cat - "$gla" > tmp && mv tmp "$gla"

	elif grep -qF "epicurious.com" $gla; then
   		echo "epicurious.com" | cat - "$gla" > tmp && mv tmp "$gla"
	fi
done
