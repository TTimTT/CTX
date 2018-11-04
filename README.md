# Title
**Captain Cook: recipes exploration**
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

# Questions for TA
- We hesitate about the **research questions 3)**: we aren't sure of how difficult
it would be to implement such a comparaison between ingredients/recipes, as it
would need for us to take into account many different variables
(e.g we can replace eggs with bananas only for desserts), shall we try it anyways?

