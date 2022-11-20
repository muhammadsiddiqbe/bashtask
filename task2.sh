#!/bin/bash

file="$1"

resultsFile=$(cat $file)

# I divided this file to 3 parts to get values

header=$(head -n 1 $file) # get the first line
body=$(head -n -2 output.txt | tail -n +3) # tests part
footer=$(tail -n 1 $file) # get the last line


echo "header: $header"
echo "body: $body"
echo "footer: $footer"

# 

# echo $footer | sed 's/.* rated as (\([^%]*%\).*/\1/'

# IFS="-----------------------------------------------------------------------------------" read -ra result <<< $resultsFile
# echo "${result[*]}"

# # READ FOOTER VALUES
# IFS=',' read -ra split <<< "$footer"

# passedCount=$(echo "${split[0]}")
# failedCount=$(echo "${split[1]}")
# ratedPercent=$(echo "${split[2]}")
# spentTime=$(echo "${split[4]}")

# echo "${split[*]}"

# echo "$resultsFile" | sed 's/.*- \(.*\)-/\1/'
