#!/bin/bash

if [ $# != 1 ]
then
  echo "usage: <path>"
  exit 1
fi
path=$1

if [[ $path == //* ]]
then
  path=gs:$path
fi

if [[ $path != */ ]]
then
  path=$path/
fi

if [[ $path != *maint-jobs/ ]]
then
  path=${path}maint-jobs/
fi

dir=/tmp/${USER}.$(basename "$0" | cut -d '.' -f 1).$(date "+%F_%T")
mkdir $dir
gsutil -m cp -r $path* $dir
echo "gunzipping ..."
find $dir -name '*gz' -exec gunzip {} \;
echo "gunzipping ... done"
echo "result in $dir"
