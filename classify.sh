#!/bin/bash

input=/tmp/${USER}.$(basename "$0" | cut -d '.' -f 1).input.$$
results=/tmp/${USER}.$(basename "$0" | cut -d '.' -f 1).results.$$

cat - > ${input}
echo -n '' > ${results}

total=$(cat ${input} | wc -l)
g="$^"
for e in "$@"
do
  cat ${input} |
  egrep -v "$g" |
  grep "$e" |
  wc -l |
  tr '\n' ' ' >> ${results}
  echo "$e" >> ${results}
  g="$g|$e"
done

echo "${total} total"
echo
sort -n -r ${results}
echo

remaining=$(
  cat ${input} |
  egrep -v "$g" |
  wc -l
)
if [ "$remaining" -gt "0" ]
then
  echo "$remaining remaining, including:"
  cat ${input} |
  egrep -v "$g" |
  head -1
fi

rm ${input}
rm ${results}