#!/bin/bash
# Author: Abubakkar Khan Fazla Rabbi
# github Licence: https://github.com/sittiksimano/comma-separator-and-file-data-search-/blob/main/LICENSE
exec < $1
read header
while read line
do
tr ',' '\n' < $1
done > temp.txt
printf "Results After Removing comma: \n"
if [ -e temp.txt ]
then
sort temp.txt | uniq > sorted.txt
cat sorted.txt
fi
if [ -e temp.txt ]
then
fgrep -w -o -f "temp.txt" "$2" > tested.txt  # Its checking if temp.txt file data are exists in second.txt
fi
printf "\nFound these words in second file:\n "
cat tested.txt
printf "\n\n Result saved in tested.txt\n"

rm temp.txt
