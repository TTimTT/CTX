# Title
Captain Cook
# Abstract
Would you use a tool that proposes a recipe that you would really like, given
the list of ingredients in your fridge?  
This project makes use of the [**Cooking recipes**](http://infolab.stanford.edu/~west1/from-cookies-to-cooks/recipePages.zip) dataset to offer different recipes while using the list of ingredients given by the user.  
Our aim is to provide a service that helps people to waste less food, improve
their health and introduce them to different types of recipes.

# Research questions
1) Which culture has the most famous recipe?
2) What is the distribution of ingredients for each culture?
---> check TODO
3) How/Can we replace a famous recipe's ingredient by another similar 
one?/ Replace a famous recipe by another recipe?
4) Can we find an equivalent recipe with less calories?
---->
5) Can people waste less food with the right tools?


# Dataset
"Cooking recipes" dataset.
How to get the data:
First, get only the pages containing recipes while ignoring miscellaneous pages.
Parsing HTML files with BeautifulSoup library and seeking "ingredients" related class or tags in the files with regex.
Since the dataset is quite big (~2.5 Gb), the first part would be done in pyspark
but after fetching the recipes which represent a small part of HTML files we can
easily use Pandas DataFrame for the implementation of our project.
The data cleaning would be done in spark, then we save these data into a Pandas'
DataFrame file, thus to process it later.
A second dataset, which correspond to the user ingredient, is use as a criteria
to seek the matching recipes by relational link with foods.
We can propose different level of ingredient similarity, depending on how many ingredients the
user has or wants to use.

# A list of internal milestones up until project milestone 2
- Loading the HTML files with BeautifulSoup into pyspark
- Cleaning Phase with pyspark: Keeping only titles and ingredients list
- Saving the cleaned DataFrame as Pandas df
- Classification of the recipes by food ingredient, recipe type/culture or health benefits
- A tag (<chocolate>) is assigned for each ingredient, one recipe has 
multiple tags (like in HW3). Similar ingredients are assigned the same 
tags

# Questions for TAa
Add here some questions you have for us, in general or project-specific.
