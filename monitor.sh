#!/bin/bash
#set -x

if [ $# -lt 2 ]
then
  echo "usage: <sleep> <command>"
  exit 1
fi

sleep=$1
shift

while $(sleep ${sleep})
do
	$@
	random_word.sh
done
