#!/bin/bash

# set up our vars
OUTPUT_DIR="output"
TOP_DIR=`pwd`
TEX_FILE="code" # leave off the .tex extension

# make our output directory (no worries if this already exists)
mkdir $OUTPUT_DIR

# clean up any past output
cd $OUTPUT_DIR
rm *.aux *.idx *.ind *.log *.toc *.pdf *.html *.css *.pl *.maf *.mtc *.mtc* WARNINGS
cd $TOP_DIR

# do this twice to ensure proper ToC -- this is NORMAL for complex LaTeX documents
# don't write the pdf the first time (just the support files), halt on any errors,
# and only print output from a single execution
pdflatex -draftmode -halt-on-error -output-directory=$OUTPUT_DIR $TEX_FILE.tex > /dev/null
cd $OUTPUT_DIR
makeindex $TEX_FILE.idx
cd $TOP_DIR
pdflatex -halt-on-error -output-directory=$OUTPUT_DIR $TEX_FILE.tex
