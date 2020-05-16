#!/bin/bash

if [ $# != 2 ]
then
  echo "usage: <term> <file>"
  exit
fi

term="$1"
file=$2

start=1
n=$(
  wc -l $file |
  awk '{print $1}'
)
i=1
for end in $(
  grep -n "$term" $file |
  awk '{p = index($0, ":"); print substr($0, 1, p - 1)}'
)
do
  tmp1=$(
    echo "$n - $start + 1" |
    bc
  )
  tmp2=$(
    echo "$end - $start" |
    bc
  )
  cat $file |
  tail -$tmp1 |
  head -$tmp2 > $file.$i
  echo "$file.$i written"
  i=$(echo "$i + 1" | bc)
  start=$end
done
end=$(echo "$n + 1" | bc)
tmp1=$(echo "$n - $start + 1" | bc)
tmp2=$(echo "$end - $start - 1" | bc)
cat $file |
tail -$tmp1 > $file.$i
echo "$file.$i written"
