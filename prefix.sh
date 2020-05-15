#!/bin/bash
#set -x

if [ $# == 0 ]
then
  w=200
else
  w=$1
fi

awk "{print substr("'$'"0, 0, $w)}"
