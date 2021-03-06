#!/bin/bash

# script to file + cat to pass colors correctly

file=/tmp/${USER}.$(basename "$0" | cut -d '.' -f 1).$$
script -q /dev/null git --no-pager diff > $file
for i in $(git ls-files --others --exclude-standard | tr '\n' ' ')
do
  script -q /dev/null git --no-pager diff -- /dev/null "$i" >> $file
done
less -XF $file
rm $file
