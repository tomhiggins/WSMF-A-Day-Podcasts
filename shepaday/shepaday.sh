#!/bin/bash

# Shep-A-Day rss generator
# CC 2011 by tomwsmf

today=$(date  +%m" "%d)
pubdate=$(date -R)
echo "<?xml version='1.0' encoding='UTF-8'?>"
echo "<rss xmlns:itunes='http://www.itunes.com/dtds/podcast-1.0.dtd' version='2.0'>"
echo "<channel>"
echo "<language>en-us</language>"
echo "<title>Shep-A-Day</title>"
echo "<image>"
echo "     <url>http://tomwsmf.com/podcasts/shepadaylogo.jpg</url>"
echo "     <title>Shep-A-Day</title>"
echo "     <link>http://tomwsmf.com/blog</link>"
echo "</image>"
echo "<link>http://tomwsmf.com/blog</link>"
echo "<description>What was Jean Shepherd yaking about on this day in history?</description>"
echo "<itunes:summary>What was Jean Shepherd yaking about on this day in history?</itunes:summary>"
echo "<itunes:owner>"
echo "<itunes:name>WSMF</itunes:name>"
echo "<itunes:author>ShepADay</itunes:author>"
echo "<itunes:email>shepaday@tomwsmf.com</itunes:email>"
echo "</itunes:owner>"
echo "<itunes:author>ShepADay</itunes:author>"
echo "<itunes:email>shepaday@tomwsmf.com</itunes:email>"
echo "<itunes:image href='http://tomwsmf.com/podcasts/shepadaylogo.jpg' />"
echo "<itunes:category text='Society &amp; Culture'>"
echo "<itunes:category text='History' />"
echo "</itunes:category>"
echo "<copyright>Public Domain</copyright>"
echo "<lastBuildDate>$pubdate</lastBuildDate>"
grep  "$today" /home/tomwsmf/shepaday/shepadaylist.txt|sed "s/insertdate/$pubdate/g"
echo "</channel>"
echo "</rss>"
