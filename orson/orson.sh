#!/bin/bash

# O For Orson Podcast the OrsonWelles-A-Day rss generator
# CC 2016 by tomwsmf

today=$(date  +%m"-"%d)
pubdate=$(date -R)
echo "<?xml version='1.0' encoding='UTF-8'?>"
echo "<rss xmlns:itunes='http://www.itunes.com/dtds/podcast-1.0.dtd' version='2.0'>"
echo "<channel>"
echo "<language>en-us</language>"
echo "<title>O For Orson Podcast</title>"
echo "<image>"
echo "     <url>http://tomwsmf.com/podcasts/orson.jpg</url>"
echo "     <title>O For Orson Podcast</title>" 
echo "     <link>http://tomwsmf.com/blog</link>"
echo "</image>"
echo "<link>http://tomwsmf.com/blog</link>"
echo "<description>O For Orson Podcast. Orson Welles on the air on this day in history.</description>"
echo "<itunes:summary>O For Orson Podcast. Orson Welles on the air on this day in history. </itunes:summary>"
echo "<itunes:owner>"
echo "<itunes:name>WSMF</itunes:name>"
echo "<itunes:email>orson@tomwsmf.com</itunes:email>"
echo "</itunes:owner>"
echo "<itunes:explicit>no</itunes:explicit>"
echo "<itunes:name>WSMF</itunes:name>"
echo "<itunes:email>shepaday@tomwsmf.com</itunes:email>"
echo "<itunes:author>Tomwsmf</itunes:author>"
echo "<itunes:image href='http://tomwsmf.com/podcasts/orson.jpg' />"
echo "<itunes:category text='Society &amp; Culture'>"
echo "<itunes:category text='History' />"
echo "</itunes:category>"
echo "<copyright>Public Domain</copyright>"
echo "<lastBuildDate>$pubdate</lastBuildDate>"
grep  "$today" /home/tomwsmf/orson/orsonlist.txt|sed "s/insertdate/$pubdate/g"
echo "</channel>"
echo "</rss>"
