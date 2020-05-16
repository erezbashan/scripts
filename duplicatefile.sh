#!/bin/bash

if [ $# != 2 ]
then
  echo "usage: <file> <num>"
  exit 1
fi
file=$1
num=$2
base=$(basename -- "${file}")
ext="${base##*.}"
name="${base%.*}"
name=$(echo ${name} | tr " " "_")
for i in $(eval echo "{1..$num}")
do
  cp ${file} ${name}-${i}.${ext}
done
open ${name}-*.${ext}
