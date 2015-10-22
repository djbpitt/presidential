# stem.py
#
# Synopsis: Lowercases and stems the first <body> descendant of
#           English-language XML input file
#
# Syntax: python stem.py filename.xml
# Input:  filename.xml, specified on command line
# Output: filename.txt
# Requires: Python 3
# djbpitt@gmail.com
# http://www.obdurodon.org

import sys, nltk
from lxml import etree
from nltk import word_tokenize

# Read input filename from command line
filename = sys.argv[1]

# Save filename without '.xml' extension to create output filename
basename = filename.split('.')[0]

# Open input file and read contents
with open(sys.argv[1], 'rb') as f:
    contents = f.read()

# Extract <body> with XPath and get string value
xml = etree.XML(contents)
body = xml.xpath('//body')[0].xpath('string()')

# Tokenize, lowercase, and stem
tokens = word_tokenize(body)
words = [w.lower() for w in tokens]
porter=nltk.PorterStemmer()
stems = [porter.stem(w) for w in words]

# Output filename = input filename, but with '.txt' instead of '.xml'
# Write output file
output=open(basename + '.txt', 'w')
for stem in stems:
    print(stem, file=output)
output.close()