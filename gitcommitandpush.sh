#!/bin/bash

if [ $# != 2 ]
then
  echo "usage: <commit message> <tested_label>"
  exit 1
fi
gitcommit.sh "$1" "$2" &&
gitpush.sh
