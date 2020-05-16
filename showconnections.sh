#!/bin/bash

if [ $# != 3 ]
then
  echo "usage: <name> <port> <pattern>"
  exit 1
fi
name=$1
port=$2
pattern=$3

netstat -an |
grep ESTABLISHED |
egrep ${port} |
awk "{print \$5}" |
sort -u |
cut -d : -f 1 |
nslookup |
grep ${name} |
sed -e "s/${pattern}/\*/" |
awk "{print \$NF}" |
sort -u
