#!/usr/bin/env python

## TODO Powder <-> Baking Powder!!!!
## grass <-> lemon grass

import pandas as pd
import os

ing_list = pd.read_csv('ing_list.csv')

cleaned_list = list()
for i in range(1139,len(ing_list)):
    print('############################################')
    print('\033[1m' + ing_list.iloc[i,1], '\033[0m\n')
    os.system('grep -m1 --color " '+ing_list.iloc[i,1]+' " ./data/allrecipes_desc.csv ')

    print('Is this an ingredient?\n (Yes=[Enter] | No=[Space]')
    x = input()
    if not x:
        print('\033[92mAccepted\033[0m\n')
        text_file = open("cleaned_list", "a")
        text_file.write(ing_list.iloc[i,1]+'\n')
        text_file.close()

    else:
        print('\033[92mRemoved\033[0m\n')

# Wierd word? to remove
# julienne
# kosher
# bouillon
# seed/seeds
# jack
# sherry
# bone
# liqueur
# crocker
# pizza
# wings
# jalape
# colby
# crescent
# cake/muffin/brownie
# hass
# slaw
# curds
# lawry
# coarsley
# verts
# spun
# piecrusts
# pace
# wraps
# hines
# scapes
# blackstrap
# smokies
# oise
# tawny
# concord
# whiz
# silks
# macintosh
# claussen

# To add
# savory

### Pause at grands
