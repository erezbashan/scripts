#!/bin/bash
set -e

url=$(
  cat .git/config |
  awk '/url =/ {print $3}'
)
name_according_to_url=$(
  echo $url |
  awk -F "/" '{print $NF}'
)
name_according_to_dir=$(
  pwd |
  awk -F "/" '{print $NF}'
)
if [ "$name_according_to_url" != "$name_according_to_dir" ]
then
  echo "name_according_to_url $name_according_to_url is not the same as name_according_to_dir $name_according_to_dir"
  exit 1
fi
name=$name_according_to_dir
cd ..
tmpname=/tmp/${USER}.$(basename "$0" | cut -d '.' -f 1).$name.$(date "+%F_%T")
mv $name $tmpname
echo "previous at $tmpname"
git clone $url
cd $name

