#!/bin/bash

file=/tmp/${USER}.$(basename "$0" | cut -d '.' -f 1).$$

while $(sleep 1)
do 
  jstack.sh >> ${file}
  echo "written into ${file}"
done
