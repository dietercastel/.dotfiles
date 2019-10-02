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
import functools

# Only look at first 100 lines
maxlines = 100
commonWordsDict = {
"en_us" : [" the "," and "," a ", " to ", "The ", " an "],
"nl" : [" de "," en "," in ", " van ", " op ", "De ", "Het "],
"fr" : [" un "," une "," des ", " ce ", " je ", "Ce ", "Un ", "Une ", " il ", " elle "]
}
langs = list(commonWordsDict.keys())
indexDict = dict(zip(range(0,len(langs)), langs))
# print(indexDict) 

def getLangs():
    return langs

#Fix countOcc with lang + lines param? Or alternative.
def countOccurences(lang,lines):
    # print(lang)
    tot = 0
    for l in lines:
        for w in commonWordsDict[lang]:
           # print(l)
           # print(w)
           tot += l.count(w)
    return tot

def classifyLanguage(filename, maxlines):
    #TODO: fix maxlines with overflow check
   lines = open(filename, encoding='utf-8').readlines(2048)
   print(langs)
# print(startoffile)
   countOLines = functools.partial(countOccurences, lines=lines)
   scores = map(countOLines, langs)
   scl = list(scores)
   # print(scl)
   maxVal = max(scl)
   # print(maxVal)
   maxIdx = scl.index(maxVal)
   return indexDict[maxIdx]

if __name__ == '__main__':
    #Figure out why it still gets executed on import.
    print('Executing');
    if len(sys.argv > 1):
        filename =  sys.argv[1]
        print(classifyLanguage(filename,maxlines))
