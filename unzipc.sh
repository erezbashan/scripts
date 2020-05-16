#!/bin/bash

if [ $# != 2 ]
then
  echo "usage: <zipfile> <pattern>"
  exit
fi

zipfile=$1
pattern=$2
tmp=/tmp/unzipc.$$

unzipl.sh $zipfile $pattern > $tmp
n=$(cat $tmp | wc -l)
if [ $n != 1 ]
then
  echo "$n matches found:"
  cat $tmp
  return
fi
unzip -q -c $zipfile $(cat $tmp)
