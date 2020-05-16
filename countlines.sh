#!/bin/bash
#set -x

sort | uniq -c | sort --numeric-sort -r
