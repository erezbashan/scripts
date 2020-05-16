#!/bin/bash

if [ $# != 2 ]
then
  echo "usage: <commit message> <tested_label>"
  exit 1
fi

gitdiff.sh
read -n1 -r -p "Press any key to continue..." key
echo
git add .
git commit -m "$1" -m "Tested: $2"
