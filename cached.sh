#!/bin/bash

cached_file=$(cachedfilename.sh $@)
if [ -f $cached_file ]
then
  modified=$(date -r $cached_file +%s)
  now=$(date +%s)
  diff=$((now - modified))
  if [ $diff -lt 300 ]
  then
    cat $cached_file
    exit $(cat $cached_file.status)
  fi
fi
$@ > $cached_file.tmp 2>&1
echo $? > $cached_file.status.tmp
mv -f $cached_file.tmp $cached_file
mv -f $cached_file.status.tmp $cached_file.status
cat $cached_file
exit $(cat $cached_file.status)
