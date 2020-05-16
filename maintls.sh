#!/bin/bash

if [ $# != 1 ]
then
  echo "usage: <job_name>"
  exit 1
fi
gsutil ls gs://waze-maint-job-logs/$1 |
tail -10

