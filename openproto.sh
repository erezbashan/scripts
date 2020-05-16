#!/bin/bash

cat $@ |
sed -e "s/\([[:alnum:]_]* {\) /^\1^/g" |
sed -e "s/}\([^ ]\)/^}^\1/g" |
sed -e "s/} /^}^/g" |
sed -e "s/\([[:alpha:]][[:alnum:]_]*:\)/^\1/g" |
sed -e "s/\^\^/^/g" |
tr ^ '\n' |
awk '/}/ {indent = substr(indent, 1, length(indent) - 1)} {print indent""$0} /{/ {indent = indent" "}'