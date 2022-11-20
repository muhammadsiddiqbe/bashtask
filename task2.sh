#!/bin/bash

file="$1"

resultsFile=$(cat $file)

header=$(head -n 1 $file) # get the first line
footer=$(tail -n 1 $file) # get the last line

# IFS="-----------------------------------------------------------------------------------" read -ra result <<< $resultsFile
# echo "${result[*]}"

# # READ FOOTER VALUES
# IFS=',' read -ra split <<< "$footer"

# passedCount=$(echo "${split[0]}")
# failedCount=$(echo "${split[1]}")
# ratedPercent=$(echo "${split[2]}")
# spentTime=$(echo "${split[4]}")

# echo "${split[*]}"

echo "$resultsFile" | sed 's/.*- \(.*\)-/\1/'
