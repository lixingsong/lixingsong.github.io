#!/bin/bash

if [[ $# != 2 ]];then
  echo "First get the bib from the CV folder in overleaf, and"
  echo "maybe prune some unnecessary items. Then using the following command"
  echo ""
  echo "Usage: $0 <path to bib2xhtml folder> <path to bib file>"
  echo "It will generate a html file named output.html"
  exit 1
fi
BIB2XHTML_PATH=$1
BIBFILE=$2

CUR_PATH=`pwd`
sed 's/\\textbf//g' $BIBFILE|sed 's/L\. Song/Lixing Song/g' > $BIB2XHTML_PATH/pub.bib
(cd $BIB2XHTML_PATH;./bib2xhtml -n "Lixing Song" -s empty -r -c ./pub.bib $CUR_PATH/output.html;rm ./pub.bib)
