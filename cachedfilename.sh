#!/bin/bash

if type md5 &>/dev/null
then
  hash=$(
    echo -n "$@" |
    md5
  )
elif type md5sum &>/dev/null
then
  hash=$(
    echo -n "$@" |
    md5sum |
    awk '{print $1}'
  )
else
  echo "Can't find no md5 nor md5sum on this machine"
  exit 1
fi

echo "/tmp/${USER}.$(basename "$0" | cut -d '.' -f 1).${hash}"
