#!/bin/bash

if [ $# -lt 2 ]
then
  echo "usage: <CamelCaseServerName> <env> <env> ..."
  exit 1
fi
camel=$1
shift
envs=$@
sd_urls=

for env in $envs
do
  sd_urls="$sd_urls https://app.google.stackdriver.com/dashboards/p2p_${camel}_${env}-online?project=waze-prod&timeDomain=6h"
done

open $sd_urls
