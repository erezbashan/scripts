#!/bin/bash

awk='
match($0, /^   java.lang.Thread.State: (.*)$/, a) {
  state = a[1]
  if (max < length(state)) {
    max = length(state)
  }
}

match($0, /^\tat (.*)$/, a) {
  n += 1
  states[n] = state
  ats[n] = a[1]
}

END {
  for (i = 1; i <= n; i++) {
    printf "%-"max"s\t%s\n", states[i], ats[i]
  }
}
'

gawk "$awk" $@ | countlines.sh


