#!/bin/bash

# The WSMF Broadcast Day rss/m3u archive generator
# CC 2017 by tomwsmf


pubdate=$(date -R)
archivedir="/home/tomwsmf/tomwsmf.com/podcasts/wsmfadayarchive/"
basefilename="wsmfaday"
enclosurelist="/home/tomwsmf/podcasts/lists/wsmfaday.list"

# Variables for creating the podcast
head="<?xml version='1.0' encoding='UTF-8'?><rss xmlns:itunes='http://www.itunes.com/dtds/podcast-1.0.dtd' version='2.0'><channel>"
lang="<language>en-us</language>"
title="<title>WSMF Broadcast Day Podcast</title>"
image="<image>     <url>http://tomwsmf.com/podcasts/wsmfbroadcastdaylogo.jpg</url> <title>Radio broadcasts from this day in history presented as a daily podcast.</title><link>http://tomwsmf.com/blog</link></image>"
link="<link>http://tomwsmf.com/blog</link>"
desc="<description>Radio broadcasts from this day in history presented as a daily podcast.</description>"
itunes="<itunes:summary>Broadcasts on this day in history. </itunes:summary> <itunes:owner> <itunes:name>WSMF</itunes:name> <itunes:email>shepaday@tomwsmf.com</itunes:email></itunes:owner><itunes:author>Tomwsmf</itunes:author><itunes:explicit>no</itunes:explicit><itunes:email>shepaday@tomwsmf.com</itunes:email><itunes:image href='http://tomwsmf.com/podcasts/wsmfbroadcastdaylogo.jpg' /><itunes:category text='Society &amp; Culture'><itunes:category text='History' /></itunes:category>"
copyright="<copyright>Public Domain</copyright>"
lastbuild="<lastBuildDate>$pubdate</lastBuildDate>"
tail="</channel></rss>"
enclosure=""

# Variables for creating the m3u
header="#EXTM3U"
urls=""
titles=""
tag="mp3"
m3ulist=""
m3ulist="$header"$'\n'

# Create a podcast for each day of each month and place it in the archive directory
for month in {01..12}
do
        for day in {01..31}
        do
           enclosure=$(grep "$month $day" "$enclosurelist"|sed "s/insertdate/$pubdate/g")
           thisday="$head $lang $title $image $link $desc $itunes $copyright $lastbuid $enclosure $tail"
           echo "$thisday" >"$archivedir$basefilename$month$day.rss"

# Create an m3u from the podcast created above andplace it in the archive directory
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
	   done <"$archivedir$basefilename$month$day.rss"
	   echo "$m3ulist" >"$archivedir$basefilename$month$day.m3u"

	done
done

