#!/bin/bash

# set up our vars
OUTPUT_DIR="output"
TOP_DIR=`pwd`

# make our output directory (no worries if this already exists)
mkdir $OUTPUT_DIR

# clean up any past output
cd $OUTPUT_DIR
rm *.aux *.log *.toc *.pdf *.html *.css *.pl *.maf *.mtc *.mtc* WARNINGS
cd $TOP_DIR

# do this twice to ensure proper ToC -- this is NORMAL for complex LaTeX documents
# don't write the pdf the first time (just the support files), halt on any errors,
# and only print output from a single execution
pdflatex -draftmode -halt-on-error -output-directory=$OUTPUT_DIR code.tex > /dev/null
pdflatex -halt-on-error -output-directory=$OUTPUT_DIR code.tex

