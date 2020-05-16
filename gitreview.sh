#!/bin/bash

branch=$(
  git branch 2>/dev/null |
  grep '^*' |
  head -1 |
  cut -d ' ' -f 2
)

echo "pushing to HEAD:refs/for/$branch"
git pull --rebase &&
git push origin HEAD:refs/for/$branch |&
tee /tmp/review.$$
if grep -q 'missing Change-Id in message footer' /tmp/review.$$
then
  f=$(git rev-parse --git-dir)/hooks/commit-msg
  mkdir -p $(dirname $f)
  curl -Lo $f https://gerrit-review.googlesource.com/tools/hooks/commit-msg
  chmod +x $f
  git commit --amend --no-edit
  git pull --rebase && git push origin HEAD:refs/for/$branch |&
  tee /tmp/review.$$
fi
open $(
  cat /tmp/review.$$ |
  g "http" |
  awk '{print $2}'
)

