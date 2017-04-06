#!/bin/bash
# Backup the podcasts and environs
# 2017 Tom Higgins

today=$(date +%Y%m%d)

cp /home/tomwsmf/podcasts/feeds/* /home/tomwsmf/podcasts/backups/feeds/
cp /home/tomwsmf/podcasts/lists/* /home/tomwsmf/podcasts/backups/lists/
cp /home/tomwsmf/podcasts/dailyfeeds/* /home/tomwsmf/podcasts/backups/dailyfeeds/
cp /home/tomwsmf/podcasts/* /home/tomwsmf/podcasts/backups/
cp -R /home/tomwsmf/tomwsmf.com/podcasts/* /home/tomwsmf/podcasts/backups/tomwsmf.com/podcasts/
zip -r /home/tomwsmf/podcasts/backups/podcastsbu"$today".zip /home/tomwsmf/podcasts/backups/
