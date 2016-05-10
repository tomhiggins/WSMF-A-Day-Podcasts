#!/bin/bash

# Hot-Buttered Podcast the Movie-A-Day rss generator
# CC 2016 by tomwsmf

today=$(date  +%m"-"%d)
pubdate=$(date -R)
echo "<?xml version='1.0' encoding='UTF-8'?>"
echo "<rss xmlns:itunes='http://www.itunes.com/dtds/podcast-1.0.dtd' version='2.0'>"
echo "<channel>"
echo "<language>en-us</language>"
echo "<title>The Hot-Buttered Podcast</title>"
echo "<image>"
echo "     <url>http://tomwsmf.com/podcasts/hbp.jpg</url>"
echo "     <title>The Hot-Buttered Podcast</title>" 
echo "     <link>http://tomwsmf.com/blog</link>"
echo "</image>"
echo "<link>http://tomwsmf.com/blog</link>"
echo "<description>The Hot-Buttered Podcast. A movie related old time radio show a day podcast.</description>"
echo "<itunes:summary>The Hot-Buttered Podcast. A movie related old time radio show a day podcast. </itunes:summary>"
echo "<itunes:owner>"
echo "<itunes:name>WSMF</itunes:name>"
echo "<itunes:email>shepaday@tomwsmf.com</itunes:email>"
echo "</itunes:owner>"
echo "<itunes:explicit>no</itunes:explicit>"
echo "<itunes:author>Tomwsmf</itunes:author>"
echo "<itunes:email>shepaday@tomwsmf.com</itunes:email>"
echo "<itunes:image href='http://tomwsmf.com/podcasts/hbp.jpg' />"
echo "<itunes:category text='Society &amp; Culture'>"
echo "<itunes:category text='History' />"
echo "</itunes:category>"
echo "<copyright>Public Domain</copyright>"
echo "<lastBuildDate>$pubdate</lastBuildDate>"
grep  "$today" /home/tomwsmf/movies/hbplist.txt|sed "s/insertdate/$pubdate/g"
echo "</channel>"
echo "</rss>"
