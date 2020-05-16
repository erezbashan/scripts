#!/bin/bash

name=$@
if [[ $name == *"-row"* ]]; then
  bucket="europe-west4-flamegraphs"
elif [[ $name == *"-il"* ]]; then
  bucket="europe-west4-flamegraphs"
elif [[ $name == *"-am"* ]]; then
  bucket="us-east1-flamegraphs"
else
  echo "unknown bucket"
  return
fi

awk='
{
  p = index($0, "-v")
  if (p == 0) {
    print $0
  }
  else {
    print substr($0, 0, p - 1)
  }
}
'

service=$(
  echo $name |
  awk "$awk"
)

open "https://pantheon.corp.google.com/storage/browser/$bucket/$service?authuser=0&prefix=$name"
