# stem-paragraph.py
#
# Synopsis: Lowercases and stems the first <body> descendant of
#           English-language XML input file
#
# Syntax: python stem-paragraph.py filename.xml
# Input:  filename.xml, specified on command line
# Output: filename-x.txt (where x is a positive integer)
# Requires: Python 3
# djbpitt@gmail.com
# http://www.obdurodon.org

import sys, nltk
from lxml import etree
from nltk import word_tokenize

counter = 0

# Read input filename from command line
filename = sys.argv[1]

# Save filename without '.xml' extension to create output filename
basename = filename.split('.')[0]

# Open input file and read contents
with open(sys.argv[1], 'rb') as f:
    contents = f.read()

# Extract <p> elements with XPath
xml = etree.XML(contents)
paragraphs = xml.xpath('//p')

#Process each paragraph
for paragraph in paragraphs:
    # Prepare output file
    counter += 1
    output = open(basename + '_p' + str(counter).zfill(3) + '.txt','w')

    # Tokenize, lowercase, and stem
    tokens = word_tokenize(paragraph.xpath('string()'))
    words = [w.lower() for w in tokens]
    wnl=nltk.WordNetLemmatizer()
    lemmata = [wnl.lemmatize(w) for w in words]

    # Write output file
    for lemma in lemmata:
        print(lemma, file=output)
    output.close()