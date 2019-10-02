#!python3
#
# Usage:
# python3 getlang.py filetocheck
# Returns:
# A string corresponding to the most likely language in the file. 
#
# To be used in conjunction with vim spelllang setting to automatically select the language.

common["en_us"] = [" the "," and "," a ", " to ", "The ", "an"]
common["nl"] = [" de "," en "," in ", " van ", " op ", "De ", "Het "]
