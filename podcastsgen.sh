#!/bin/bash

# Daily podcast and m3u generator
# CC 2011 by tomwsmf

today=$(date  +""%m""%d)


# Generate the single podcasts rss feeds for today
/home/tomwsmf/shepaday/shepaday.sh >/home/tomwsmf/tomwsmf.com/podcasts/shepaday.rss
cp /home/tomwsmf/tomwsmf.com/podcasts/shepaday.rss /home/tomwsmf/tomwsmf.com/otr/JeanShepherd/rss.xml
/home/tomwsmf/comedy/comedyaday.sh  >/home/tomwsmf/tomwsmf.com/podcasts/thisdayinfunny.rss
/home/tomwsmf/history/mrpeabody.sh  >/home/tomwsmf/tomwsmf.com/podcasts/historynow.rss
/home/tomwsmf/detecives/HB.sh  >/home/tomwsmf/tomwsmf.com/podcasts/hardboiled.rss
/home/tomwsmf/fib/fibaday.sh  >/home/tomwsmf/tomwsmf.com/podcasts/fibaday.rss
/home/tomwsmf/sf/sfaday.sh  >/home/tomwsmf/tomwsmf.com/podcasts/sfaday.rss
/home/tomwsmf/serialized/serialized.sh  >/home/tomwsmf/tomwsmf.com/podcasts/serialized.rss
/home/tomwsmf/ote/ote.sh  >/home/tomwsmf/tomwsmf.com/podcasts/oteaday.rss
/home/tomwsmf/movies/hbp.sh >/home/tomwsmf/tomwsmf.com/podcasts/hbp.rss
/home/tomwsmf/orson/orson.sh >/home/tomwsmf/tomwsmf.com/podcasts/orson.rss
/home/tomwsmf/bbc/britcast.sh >/home/tomwsmf/tomwsmf.com/podcasts/biggestcult.rss
/home/tomwsmf/badge/badge.sh >/home/tomwsmf/tomwsmf.com/podcasts/badge.rss
/home/tomwsmf/west/west.sh >/home/tomwsmf/tomwsmf.com/podcasts/west.rss

# Generate the WSMF collective feed
/home/tomwsmf/wsmfaday.sh  >/home/tomwsmf/tomwsmf.com/podcasts/wsmfaday.rss

# Tell the log  this script ran today
date >/home/tomwsmf/tomwsmf.com/podcasts/podcastlastrun.log

# Generate the  M3U 
/home/tomwsmf/m3uaday.sh >/home/tomwsmf/tomwsmf.com/podcasts/wsmfaday.m3u

# Copy it to a dated archive M3U file
cp /home/tomwsmf/tomwsmf.com/podcasts/wsmfaday.m3u /home/tomwsmf/tomwsmf.com/podcasts/wsmfaday$today.m3u
