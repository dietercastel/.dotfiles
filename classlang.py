#!/usr/bin/env python3
#
# This script classifies the language of a file based on an advance NLP AI model. 
# (Well or just some clever programming actually.)
#
# Usage:
# python3 classlang.py filetocheck
# Returns:
# A string corresponding to the most likely language in the file. 
#
# To be used in conjunction with vim spelllang setting to automatically select the language.

import sys

# Only look at first 100 lines
maxlines = 100
filename =  sys.argv[1]
commonWordsDict = {
"en_us" : [" the "," and "," a ", " to ", "The ", " an "],
"nl" : [" de "," en "," in ", " van ", " op ", "De ", "Het "],
"fr" : [" un "," une "," des ", " ce ", " je ", "Ce ", "Un ", "Une ", " il ", " elle "]
}
langs = list(commonWordsDict.keys())
indexDict = dict(zip(range(0,len(langs)), langs))
# print(indexDict) 

startoffile = open(sys.argv[1], encoding='utf-8').readlines()[0:99]

def countOccurences(lang):
    # print(lang)
    tot = 0
    for l in startoffile:
        for w in commonWordsDict[lang]:
           # print(l)
           # print(w)
           tot += l.count(w)
    return tot

def classifyLanguage(filename,maxlines):
   startoffile = open(filename, encoding='utf-8').readlines()[0:maxlines]
# print(startoffile)
   scores = map(countOccurences, langs)
   scl = list(scores)
   # print(scl)
   maxVal = max(scl)
   # print(maxVal)
   maxIdx = scl.index(maxVal)
   # print(indexDict[maxIdx])

classifyLanguage(filename,maxlines)
