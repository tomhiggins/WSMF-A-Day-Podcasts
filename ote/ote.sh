#!/bin/bash

# Over The Edge A Day rss generator
# CC 2015 by tomwsmf

today=$(date  +%m%d_)
pubdate=$(date -R)
echo "<?xml version='1.0' encoding='UTF-8'?>"
echo "<rss xmlns:itunes='http://www.itunes.com/dtds/podcast-1.0.dtd' version='2.0'>"
echo "<channel>"
echo "<language>en-us</language>"
echo "<title>OverTheEdge-A-Day</title>"
echo "<image>"
echo "     <url>http://tomwsmf.com/podcasts/otelogo.jpg</url>"
echo "     <title>OverTheEdge-A-Day</title>"
echo "     <link>http://tomwsmf.com/blog</link>"
echo "</image>"
echo "<link>http://tomwsmf.com/blog</link>"
echo "<description>The sounds of Over The Edge broadcasts on this day in history.</description>"
echo "<itunes:summary>The sounds of Over The Edge broadcasts on this day in history.</itunes:summary>"
echo "<itunes:owner>"
echo "<itunes:name>WSMF</itunes:name>"
echo "<itunes:email>shepaday@tomwsmf.com</itunes:email>"
echo "</itunes:owner>"
echo "<itunes:author>Tomwsmf</itunes:author>"
echo "<itunes:explicit>no</itunes:explicit>"
echo "<itunes:email>shepaday@tomwsmf.com</itunes:email>"
echo "<itunes:image href='http://tomwsmf.com/podcasts/otelogo.jpg' />"
echo "<itunes:category text='Society &amp; Culture'>"
echo "<itunes:category text='History' />"
echo "</itunes:category>"
echo "<copyright>Public Domain</copyright>"
echo "<lastBuildDate>$pubdate</lastBuildDate>"
grep  "$today" /home/tomwsmf/ote/oteadaylist.txt|sed "s/insertdate/$pubdate/g"
echo "</channel>"
echo "</rss>"
