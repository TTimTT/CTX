import re
import os.path
import uritools
import numpy as np
import scipy as sp
import pandas as pd
from bs4 import BeautifulSoup

import seaborn as sns
import matplotlib.pyplot as plt

from pyspark.sql import *
import pyspark.sql.functions as f # wierd that I have to do that

# General parameters
#%matplotlib inline
plt.style.use('seaborn')#switch to seaborn style
plt.rcParams["figure.figsize"] = [16,10]

spark = SparkSession.builder.getOrCreate()

DATA_FOLDER = './data/'
RECIPES_PATH = DATA_FOLDER + 'recipePages/'

# TODO: for loop
html_string = RECIPES_PATH + '0a1d39ab1cd272227ecf547ab81a5481.html'
html = open(html_string,'r')
soup = BeautifulSoup(open(html_string), 'html.parser')

# Saving
f = open("results.txt", "a")
f.write(re.sub(r'\n|\t', '',soup.title.text))
f.close()

# For each file we first look at every possiblr website
website_titles= {}

files = os.listdir(RECIPES_PATH)
for filename in files:
    
    # Opening HTML file
    with open(RECIPES_PATH + filename, 'rb') as file:
        try:
            # Parsing the HTML file
            soup = BeautifulSoup(file, 'html.parser')
    
            # Retrieve the HostName
            hostname = uritools.urisplit(soup.find('a',href=True)['href']).gethost()
    
            # Append the HostName if not seen yet
            website_titles.update({hostname: filename})
            
        except : # whatever reader errors you care about
            continue

print(website_titles)

# Saving
f = open("results.txt", "a")
f.write(website_titles)
f.close()
