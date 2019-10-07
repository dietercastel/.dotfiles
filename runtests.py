#!/usr/bin/env python3

import unittest
import os
from utils import classlang
from utils import classpy 


testdir = "./tests"
langdir = os.path.join(testdir,"langfiles")
langext = ".md"
pydir = os.path.join(testdir,"pyfiles")
pyext = ".py"

maxpyfiles = range(1,2)

class Test(unittest.TestCase):
    #Test each language
    def testClassLang(self):
        for l in classlang.getLangs():
            print(l)
            testfn = l + langext
            testpath = os.path.join(langdir,testfn)
            testlang = classlang.classifyLanguage(testpath, maxbytes=4096)
            self.assertEqual(testlang,l)

    #Test each python version
    def testClassPy(self):
        for l in classpy.getVersions():
            for i in maxpyfiles:
                print(l)
                testfn = str(i) + "-" + l + pyext
                testpath = os.path.join(pydir,testfn)
                testlang = classpy.classifyVersion(testpath)
                self.assertEqual(testlang,l)
            

if __name__ == "__main__":
    suite = unittest.TestLoader().loadTestsFromTestCase(Test)
    unittest.TextTestRunner(verbosity=2).run(suite)  
