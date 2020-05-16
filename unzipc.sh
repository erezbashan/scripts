#!/bin/bash

if [ $# != 2 ]
then
  echo "usage: <zipfile> <pattern>"
  exit 1
fi

zipfile=$1
pattern=$2
tmp=/tmp/${USER}.$(basename "$0" | cut -d '.' -f 1).$$

unzipl.sh $zipfile $pattern > $tmp
n=$(cat $tmp | wc -l)
if [ $n != 1 ]
then
  echo "$n matches found:"
  cat $tmp
  return 2
fi
unzip -q -c $zipfile $(cat $tmp)
