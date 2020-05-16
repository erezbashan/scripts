#!/bin/bash

branch=$(
  git branch 2>/dev/null |
  grep '^*' |
  head -1 |
  cut -d ' ' -f 2
)

file=/tmp/${USER}.$(basename "$0" | cut -d '.' -f 1).$$
echo "pushing to HEAD:refs/for/$branch"
git pull --rebase &&
git push origin HEAD:refs/for/$branch |&
tee ${file}
if grep -q 'missing Change-Id in message footer' ${file}
then
  f=$(git rev-parse --git-dir)/hooks/commit-msg
  mkdir -p $(dirname $f)
  curl -Lo $f https://gerrit-review.googlesource.com/tools/hooks/commit-msg
  chmod +x $f
  git commit --amend --no-edit
  git pull --rebase && git push origin HEAD:refs/for/$branch |&
  tee ${file}
fi
open $(
  cat ${file} |
  g "http" |
  awk '{print $2}'
)
rm ${file}

