import os, re


mypath = os.path.abspath(os.path.dirname(__file__))
textFile = open(mypath+"/pandp.txt")
fulltext = textFile.read()

matches = []
for words in fulltext.split():
    if re.findall(r"[wW]ife", words):
        matches.append(words)

print "wife:", len(matches)
