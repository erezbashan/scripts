#!/bin/bash

file=/tmp/js.$$

while $(sleep 1)
do 
  jstack.sh >> ${file}
  echo "written into /tmp/js.$$"
done
