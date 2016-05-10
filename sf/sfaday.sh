#!/bin/bash

# Storied Fiction A Day rss generator
# CC 2014 by tomwsmf

today=$(date  +%m" "%d)
pubdate=$(date -R)
echo "<?xml version='1.0' encoding='UTF-8'?>"
echo "<rss xmlns:itunes='http://www.itunes.com/dtds/podcast-1.0.dtd' version='2.0'>"
echo "<channel>"
echo "<language>en-us</language>"
echo "<title>Storied Fiction A Day</title>"
echo "<image>"
echo "     <url>http://tomwsmf.com/podcasts/sf.jpg</url>"
echo "     <title>Storied Fiction A Day</title>"
echo "     <link>http://tomwsmf.com/blog</link>"
echo "</image>"
echo "<link>http://tomwsmf.com/blog</link>"
echo "<description>Stories of possible futures, pasts and todays. Radio shows broadcast on this day in history about their tomorrows. </description>"
echo "<itunes:summary>Stories of possible futures, pasts and todays. Radio shows broadcast on this day in history about their tomorrows.</itunes:summary>"
echo "<itunes:owner>"
echo "<itunes:name>WSMF</itunes:name>"
echo "<itunes:email>shepaday@tomwsmf.com</itunes:email>"
echo "</itunes:owner>"
echo "<itunes:explicit>no</itunes:explicit>"
echo "<itunes:author>Tomwsmf</itunes:author>"
echo "<itunes:email>shepaday@tomwsmf.com</itunes:email>"
echo "<itunes:image href='http://tomwsmf.com/podcasts/sf.jpg' />"
echo "<itunes:category text='Science Fiction' />"
echo "<itunes:category text='Society &amp; Culture'>"
echo "<itunes:category text='History' />"
echo "</itunes:category>"
echo "<copyright>Public Domain</copyright>"
echo "<lastBuildDate>$pubdate</lastBuildDate>"
grep  "$today" /home/tomwsmf/sf/sfadaylist.txt|sed "s/insertdate/$pubdate/g"
echo "</channel>"
echo "</rss>"
