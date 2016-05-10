#!/bin/bash

# Comedy-A-Day rss generator
# CC 2011 by tomwsmf

today=$(date  +%m" "%d)
pubdate=$(date -R)
echo "<?xml version='1.0' encoding='UTF-8'?>"
echo "<rss xmlns:itunes='http://www.itunes.com/dtds/podcast-1.0.dtd' version='2.0'>"
echo "<channel>"
echo "<language>en-us</language>"
echo "<title>This Day In Funny</title>"
echo "<image>"
echo "     <url>http://tomwsmf.com/podcasts/thisdayinfunnylogo.jpg</url>"
echo "     <title>This Day In Funny</title>"
echo "     <link>http://tomwsmf.com/blog</link>"
echo "</image>"
echo "<link>http://tomwsmf.com/blog</link>"
echo "<description>Broadcasts from this day in history that raised a laugh or three.</description>"
echo "<itunes:summary>Broadcasts from this day in history that riased a laugh or three.</itunes:summary>"
echo "<itunes:owner>"
echo "<itunes:name>WSMF</itunes:name>"
echo "<itunes:email>shepaday@tomwsmf.com</itunes:email>"
echo "</itunes:owner>"
echo "<itunes:explicit>no</itunes:explicit>"
echo "<itunes:author>Tomwsmf</itunes:author>"
echo "<itunes:email>shepaday@tomwsmf.com</itunes:email>"
echo "<itunes:image href='http://tomwsmf.com/podcasts/thisdayinfunnylogo.jpg' />"
echo "<itunes:category text='Comedy' />"
echo "<itunes:category text='Society &amp; Culture'>"
echo "<itunes:category text='History' />"
echo "</itunes:category>"
echo "<copyright>Public Domain</copyright>"
echo "<lastBuildDate>$pubdate</lastBuildDate>"
grep  "$today" /home/tomwsmf/comedy/comedylist.txt|sed "s/insertdate/$pubdate/g"
echo "</channel>"
echo "</rss>"
