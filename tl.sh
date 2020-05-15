#!/bin/bash
#set -x

file=/tmp/$(whoami).tl.$RANDOM
tee $file | less
echo "results save in $file"
