#!/usr/bin/env python3
#
# This script classifies the python version of a file based on an advance NLP AI model. 
# (Well or just some clever programming actually.)
#
# Usage:
# python3 classpy.py filetocheck
# Returns:
# A string corresponding to the most likely language in the file. 
#
# Python 2 v 3 difference from
# https://sebastianraschka.com/Articles/2014_python_2_3_key_diff.html#the-print-function


import sys
import functools

# Only look at first 100 lines
maxbytes = 2048 
commonWordsDict = {
"pyv3" : ["print(", " range(", "Error(", "Error as ", "__contains__","next("],
"pyv2" : ["print ", "xrange(", "Error,", "next()"]
}
versions = list(commonWordsDict.keys())
indexDict = dict(zip(range(0,len(versions)), versions))
# print(indexDict) 

def getVersions():
    return versions

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

def classifyVersion(filename, maxbytes = maxbytes):
   lines = open(filename, encoding='utf-8').readlines(maxbytes)
#   print(versions)
# print(startoffile)
   countOLines = functools.partial(countOccurences, lines=lines)
   scores = map(countOLines, versions)
   scl = list(scores)
   # print(scl)
   maxVal = max(scl)
   # print(maxVal)
   maxIdx = scl.index(maxVal)
   return indexDict[maxIdx]

if __name__ == '__main__':
    #Figure out why it still gets executed on import.
    if len(sys.argv) > 1:
        filename =  sys.argv[1]
        print(filename)
        print(classifyVersion(filename,maxbytes))
