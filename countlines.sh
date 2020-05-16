#!/bin/bash

sort $@ |
uniq -c |
sort --numeric-sort -r
