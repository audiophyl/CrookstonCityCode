#!/bin/bash

# set up our vars
OUTPUT_DIR="output"
TOP_DIR=`pwd`

# make our output directory (no worries if this already exists)
mkdir $OUTPUT_DIR

# clean up any past output
cd $OUTPUT_DIR
rm *.aux *.log *.toc *.pdf *.html *.css *.pl WARNINGS
cd $TOP_DIR

# do this twice to ensure proper ToC -- this is NORMAL for complex LaTeX documents
pdflatex -output-directory=$OUTPUT_DIR code.tex
pdflatex -output-directory=$OUTPUT_DIR code.tex

