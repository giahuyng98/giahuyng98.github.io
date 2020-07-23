#!/bin/bash

cat $1 | awk 'BEGIN{sum=0} {sum += $i} END{print sum}'
