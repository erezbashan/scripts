#!/bin/bash
#set -x

pid=$(ps -ef | grep 'java -X' | grep -v grep | awk '{print $2}')
file=/tmp/js.$$

while $(sleep 1)
do 
    sudo -u linqmap sh -c "jstack ${pid}" >> ${file}
    echo "written into /tmp/js.$$"
done
