#!/bin/bash

head -$((${RANDOM} % $(wc -l < /usr/share/dict/words) + 1))  /usr/share/dict/words | tail -1
