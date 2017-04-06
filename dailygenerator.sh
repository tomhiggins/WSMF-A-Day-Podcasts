#!/bin/bash

# Daily Podcast RSS/M3U Generator And Upkeep
#
# feedinfordir = directory of .info files, each desctibing a podcast
# websitedir = directory under your web server where the rss and m3u file will be offered
# codedir = directory where the code  resides
# dailyfeedsdir = directory that holds the daily generated rss and m3us before moving to the websitedir
#
# CC 2011-2017 by tomwsmf

# Location of podcast directories
websitedir="/home/tomwsmf/tomwsmf.com/podcasts/"
feedinfodir="/home/tomwsmf/podcasts/feeds/"
dailyfeedsdir="/home/tomwsmf/podcasts/dailyfeeds/"
codedir="/home/tomwsmf/podcasts/"

# Do this for each Info file in the Feed Directory


FILES="$feedinfodir"$"*info"
for f in $FILES
do
  echo "Processing $f feed ..."
  # take action on each file. $f store current file name
  line="$f"
  title=$(grep -oP "(?<=<title>)[^<]+" "$line")
  imgurl=$(grep -oP "(?<=<imgurl>)[^<]+" "$line")
  podcastwebsite=$(grep -oP "(?<=<podcastwebsite>)[^<]+" "$line")
  podcastdesc=$(grep -oP "(?<=<podcastdesc>)[^<]+" "$line")
  owner=$(grep -oPm1 "(?<=<owner>)[^<]+" "$line")
  author=$(grep -oP "(?<=<author>)[^<]+" "$line")
  email=$(grep -oP "(?<=<email>)[^<]+" "$line")
  copyright=$(grep -oP "(?<=<copyright>)[^<]+" "$line")
  category=$(grep -oP "(?<=<category>)[^<]+" "$line")
  podcastfilename=$(grep -oP "(?<=<podcastfilename>)[^<]+" "$line")
  rssdir=$(grep -oP "(?<=<rssdir>)[^<]+" "$line")
  m3udir=$(grep -oP "(?<=<m3udir>)[^<]+" "$line")
  m3ufilename=$(grep -oP "(?<=<m3ufilename>)[^<]+" "$line")
  enclosurelist=$(grep -oP "(?<=<enclosurelist>)[^<]+" "$line")


#  Set Variables For Generating The RSS File   - Do Not Change
  today=$(date  +%m" "%d)
  todayspace=$(date  +%m" "%d)
  todaydash=$(date  +%m"-"%d)
  pubdate=$(date -R)
  rsshead="<?xml version='1.0' encoding='UTF-8'?>"$'\n'$"<rss xmlns:itunes='http://www.itunes.com/dtds/podcast-1.0.dtd' version='2.0'>"$'\n'$"<channel>"
  rsslang="<language>en-us</language>"
  rsstitle="<title>$title</title>"
  rssimage="<image>"$'\n'$"<url>$imgurl</url>"$'\n'$"<title>$title</title>"$'\n'$"<link>$podcastwebsite</link>"$'\n'$"</image>"
  rsslink="<link>$podcastwebsite</link>"
  rssdesc="<description>$podcastdesc</description>"
  itunessum="<itunes:summary>$podcastdesc</itunes:summary>"
  itunesowner="<itunes:owner>"$'\n'$"<itunes:name>$owner</itunes:name>"$'\n'$"<itunes:email>$email</itunes:email>"$'\n'$"</itunes:owner>"
  itunesemail="<itunes:email>$email</itunes:email>"
  itunesauthor="<itunes:author>$author</itunes:author>"$'\n'$"<itunes:explicit>no</itunes:explicit>"
  itunesimg="<itunes:image href='$imgurl' />"
  itunescat="<itunes:category text='$category' />"$'\n'$"<itunes:category text='Society &amp; Culture'>"$'\n'$"<itunes:category text='History' />"$'\n'$"</itunes:category>"
  rsscopyright="<copyright>$copyright</copyright>"
  rsslastbuild="<lastBuildDate>$pubdate</lastBuildDate>"
  rsstail="</channel>"$'\n'$"</rss>"
  itunesblock=$"$itunessum"$'\n'$"$itunesowner"$'\n'$"$itunesauthor"$'\n'$"$itunesemail"$'\n'$"$itunesimg"$'\n'$"$itunescat"

#  Set Variables For Generating The M3U File   - Do  Not Change
  header="#EXTM3U"
  urls=""
  titles=""
  tag="mp3"
  m3ulist=""
  m3ulist="$header"$'\n'

#  Get the  shows for today and populate the item tags
  rssenclosure=$(grep "$todaydash\|$todayspace" "$enclosurelist"|sed "s/insertdate/$pubdate/g")
  thisday="$rsshead"$'\n'$"$rsslang"$'\n'$"$rsstitle"$'\n'$"$rssimage"$'\n'$"$rsslink"$'\n'$"$rssdesc"$'\n'$"$itunesblock"$'\n'$"$rsscopyright"$'\n'$"$rsslastbuild"$'\n'$"$rssenclosure"$'\n'$"$rsstail"

# Save it as a file in the proper directories
  echo "$thisday" >"$rssdir$podcastfilename"
  echo "$thisday" >"$websitedir$podcastfilename"

# Convert the RSS file into an M3U 
  while read -r line
	do
		if [[ $line =~ $tag ]]
        	then
                   urls=$(grep -oPm1 "(?<=<guid>)[^<]+" <<< "$line")
                   titles=$(grep -oPm1 "(?<=<title>)[^<]+" <<< "$line")
                   titles="${titles/.mp3/}" 
                   m3ulist="$m3ulist#EXTINF:-1,$titles"$'\n'"$urls"$'\n'
        	fi
       done <"$rssdir$podcastfilename" 

# Save it as a file in the proper directories
  echo "$m3ulist" >"$m3udir$m3ufilename"
 echo "$m3ulist" >"$websitedir$m3ufilename"
echo "... finished with $f ."
done


# Copy the ShepADay rss to a path where it used to be hosted many years ago, aint legacy just the best.
cp /home/tomwsmf/tomwsmf.com/podcasts/shepaday.rss /home/tomwsmf/tomwsmf.com/otr/JeanShepherd/rss.xml

# Make a backup of the podcasts an dirs
# "$codedir"$"podcastsbackup.sh"

# Tell the log  this script ran today
date >"$websitedir"$"podcastlastrun.log"

#All done, get a coffee.
