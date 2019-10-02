#!/usr/bin/env python3

import unittest
import os
from scripts import classlang

testdir = "./tests/langfiles"

class Test(unittest.TestCase):
    def testClassLang(self):
        for l in langs:
            print(fn)
            testfn = fn+".md"
            testpath = os.path.join(testdir,testfn)
            testlang = classlang.classifyLanguage(testpath,l)
            self.assertEqual(testlang,l)
            
        #Test each language in testfiles/

suite = unittest.TestLoader().loadTestsFromTestCase(Test)
unittest.TextTestRunner(verbosity=2).run(suite)  

