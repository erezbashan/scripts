#!/bin/bash

file=/tmp/$(whoami).tl.$RANDOM
tee $file | less
echo "results save in $file"
