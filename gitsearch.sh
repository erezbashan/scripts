#!/bin/bash

if [ $# != 1 ]
then
  echo "usage: <expression>"
  exit 1
fi

expression=$1
git bisect start HEAD $(git rev-list HEAD |
tail -n 1 ) -- |
grep 'Bisecting:'

git bisect run sh -c "grep -q -r '$expression' .; test \$? = 1" |
grep 'Bisecting:'

revB=$(git rev-parse HEAD)
git bisect reset > /dev/null 2>&1
echo
rev=$(
  git rev-list HEAD |
  grep -B 1 $revB |
  head -1
)
git checkout -q $rev
file=$(grep -l -r "$expression" .)
echo $file
echo
git annotate $file |
grep "$expression" |
awk '{print $1, $2, $3, $4, $5}'
echo
grep -C 5 "$expression" $file
git checkout -q master
