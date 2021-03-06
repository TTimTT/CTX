# Title
### *Captain Cook: the fabulous recipes explorator*
# Abstract
Would you use a tool that proposes a recipe that you would really like, given
the list of ingredients in your fridge?  
This project makes use of the [**Cooking recipes**](http://infolab.stanford.edu/~west1/from-cookies-to-cooks/recipePages.zip) dataset to offer different recipes, using the list of ingredients given by the user and classifying them by their ratings.  
Our aim is to provide a service that helps people to waste less food, improve
their health and introduce them to different types of recipes.

# Research questions
1) Which culture has the most famous recipe?
2) What is the distribution of ingredients for each culture?
3) ~How/Can we replace a famous recipe's ingredient by another similar 
one?/ Replace a famous recipe by another recipe?
4) Can we find an equivalent recipe with less calories?

# Dataset
**Dataset**: [**Cooking recipes**](http://infolab.stanford.edu/~west1/from-cookies-to-cooks/recipePages.zip)  
**How to get the data**:  
First, we get only the pages containing recipes while ignoring miscellaneous pages.  
Parsing HTML files with *BeautifulSoup* library and seeking ```<ingredients>``` related class or tags in the files with regex and also for the ```<ratings>``` and ```<calories>```.  
**Processing**: Since the dataset is quite big (~2.5 Gb), the first part would be done in *PySpark*
but after fetching the recipes which represent a small part of HTML files we can
easily use *Pandas* DataFrame for the implementation of our project.  
**Enriching**: A second dataset, which correspond to the user ingredient, is used as a criterium
to seek the matching recipes.  
We can propose different levels of ingredient similarity, depending on how many ingredients the
user has or wants to use.

# A list of internal milestones up until project milestone 2
- Loading the HTML files with *BeautifulSoup* into *PySpark*
- Cleaning Phase with *PySpark*: Keeping only titles, ingredients list, calories and ratings.
- Saving the cleaned DataFrame as a *Pandas* DataFrame
- Classification of the recipes by food ingredient, recipe type/culture or health benefits
- A tag (e.g ```<chocolate>```) is assigned for each ingredient, one recipe has 
multiple tags (like in HW3). Similar ingredients are assigned the same 
tags
- Get which culture has the most famous recipes
- Get the distribution of most used ingredients
- Finding equivalent recipes with less calories

# List of internal milestones achieved for milestone 3
- Loading HTML was done with ```PERL``` and ```BASH``` scripts
- Data was cleaned with BASH and then with Pandas since it was small enough, we didn't
retrieve ratings but we have the cooking time!
- We classified the recipes by nutritional, time or region. We just need to do it by ingredient
- Ingredients are identified and cleaned
- The distribution of ingredients is done
- Create our own JSON map to plot informations about the recipes by region more specifically
- Make the map more interactive and correct the colormap issue
- Use statistical properties of the English language or Levenshtein distance
- Finish the ingredients list cleaning and do classification
- Create a user friendly recipe finder 

# Data Story
[Captain Cook](https://ctxwebsite.github.io/)

# Contributions
Camilla: Problem formulation, data analysis, data visualization, tabulating final results, website/data story writing  
Matthieu: Data analysis, data visualization, running tests, tabulating final results  
Tim: Problem formulation, data crawling/cleaning,  preliminary data analysis, data analysis, data visualization  
