#!/bin/bash

# M3U A Day  Generator
# CC 2016 by tomwsmf

header="#EXTM3U"
urls=""
titles=""
tag="mp3"
m3ulist=""

m3ulist="$header"$'\n'
while read -r line
do
  if [[ $line =~ $tag ]]
  then
   urls=$(grep -oPm1 "(?<=<guid>)[^<]+" <<< "$line")
   titles=$(grep -oPm1 "(?<=<title>)[^<]+" <<< "$line")
   titles="${titles/.mp3/}" 
   m3ulist="$m3ulist#EXTINF:-1,$titles"$'\n'"$urls"$'\n'
  fi
done < /home/tomwsmf/tomwsmf.com/podcasts/wsmfaday.rss
echo "$m3ulist"

