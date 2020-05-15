#!/bin/bash
#set -x

pid=$(ps -ef | grep 'java -X' | grep -v grep | awk '{print \$2}')
sudo -u linqmap sh -c "jstack $(pid)"
