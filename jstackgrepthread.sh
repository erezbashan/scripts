#!/bin/bash

if [ $# -lt 1 ]
then
  echo "usage: <pattern> [<awk files>]"
  exit 1
fi

pattern=$1
shift

awk='
BEGIN {
  thread=0
}
/'$pattern'/ {
  thread=1
}

{
  if (thread == 1) {
    print
  }
}

/^$/ {
  thread=0
}
'

awk "$awk" $@