#!/bin/bash

sudo -u linqmap sh -c "jmap -histo $(javapid.sh)" | sort -n -k 2 -r
