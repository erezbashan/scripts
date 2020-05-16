#!/bin/bash

if [ $# != 2 ]
then
  echo "Usage: <from> <to>"
  exit 1
fi

from=$(
  echo $1 |
  sed -e 's/\//\\\\\//g'
)
to=$(
  echo $2 |
  sed -e 's/\//\\\\\//g'
)
sed -e "s/$from/$to/g"
