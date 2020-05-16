#!/bin/bash

echo "$(ps -ef | grep 'java -X' | grep -v grep | awk '{print $2}')"
