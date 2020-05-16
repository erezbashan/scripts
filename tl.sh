#!/bin/bash

file=/tmp/${USER}.$(basename "$0" | cut -d '.' -f 1).$(date "+%F_%T").${RANDOM}
tee $file | less
echo "results save in $file"
