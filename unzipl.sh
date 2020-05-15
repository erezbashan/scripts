#!/bin/bash
#set -x

if [ $# != 2 ]
then
  echo "usage: <zipfile> <pattern>"
  exit 1
fi

zipfile=$1
pattern=$2
unzip -q -l $zipfile | grep $pattern | awk '{print $4}'
