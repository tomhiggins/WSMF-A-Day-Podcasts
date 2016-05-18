#!/bin/bash

# WSMF Broadcast Day rss generator
# CC 2016 by tomwsmf

todaydash=$(date +%m"-"%d)
todayspace=$(date +%m" "%d)
todaynospace=$(date  +%m%d_)
todayinitspace=$(date +" "%m" "%d)
pubdate=$(date -R)
echo "<?xml version='1.0' encoding='UTF-8'?>"
echo "<rss xmlns:itunes='http://www.itunes.com/dtds/podcast-1.0.dtd' version='2.0'>"
echo "<channel>"
echo "<language>en-us</language>"
echo "<title>WSMF Broadcast Day</title>"
echo "<image>"
echo "     <url>http://tomwsmf.com/podcasts/wsmfbroadcastdaylogo.jpg</url>"
echo "     <title>WSMF Broadcast Day podcast</title>" 
echo "     <link>http://tomwsmf.com/blog</link>"
echo "</image>"
echo "<link>http://tomwsmf.com/blog</link>"
echo "<description>Radio broadcasts from this day in history presented as a daily podcast.</description>"
echo "<itunes:summary>Radio broadcasts from this day in history presented as a podcast. </itunes:summary>"
echo "<itunes:owner>"
echo "<itunes:name>WSMF</itunes:name>"
echo "<itunes:email>shepaday@tomwsmf.com</itunes:email>"
echo "</itunes:owner>"
echo "<itunes:author>Tomwsmf</itunes:author>"
echo "<itunes:explicit>no</itunes:explicit>"
echo "<itunes:email>shepaday@tomwsmf.com</itunes:email>"

echo "<itunes:image href='http://tomwsmf.com/podcasts/wsmfbroadcastdaylogo.jpg' />"
echo "<itunes:category text='Society &amp; Culture'>"
echo "<itunes:category text='History' />"
echo "</itunes:category>"
echo "<copyright>Public Domain</copyright>"
echo "<lastBuildDate>$pubdate</lastBuildDate>"
grep  "$todaydash\|$todayspace" /home/tomwsmf/shepaday/shepadaylist.txt|sed "s/insertdate/$pubdate/g"
grep  "$todaydash\|$todayspace" /home/tomwsmf/comedy/comedylist.txt|sed "s/insertdate/$pubdate/g"
grep  "$todaydash\|$todayspace" /home/tomwsmf/history/mrpeabodylist.txt|sed "s/insertdate/$pubdate/g"
grep  "$todaydash\|$todayspace" /home/tomwsmf/detecives/HBList.txt|sed "s/insertdate/$pubdate/g"
grep  "$todaydash\|$todayspace" /home/tomwsmf/fib/fibadaylist.txt|sed "s/insertdate/$pubdate/g"
grep  "$todaydash\|$todayspace" /home/tomwsmf/sf/sfadaylist.txt|sed "s/insertdate/$pubdate/g"
grep  "$todaydash\|$todayspace" /home/tomwsmf/serialized/serializedlist.txt|sed "s/insertdate/$pubdate/g"
grep  "$todaydash\|$todayspace" /home/tomwsmf/movies/hbplist.txt|sed "s/insertdate/$pubdate/g"
grep  "$todaydash\|$todayspace" /home/tomwsmf/orson/orsonlist.txt|sed "s/insertdate/$pubdate/g"
grep  "$todaydash\|$todayspace" /home/tomwsmf/badge/badgelist.txt|sed "s/insertdate/$pubdate/g"
grep  "$todayinitspace" /home/tomwsmf/bbc/britcastlist.txt|sed "s/insertdate/$pubdate/g"
grep  "$todaydash\|$todayspace" /home/tomwsmf/west/westlist.txt|sed "s/insertdate/$pubdate/g"

grep  "$todaynospace" /home/tomwsmf/ote/oteadaylist.txt|sed "s/insertdate/$pubdate/g"
echo "</channel>"
echo "</rss>"
