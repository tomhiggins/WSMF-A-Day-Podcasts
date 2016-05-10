# WSMF-A-Day-Podcasts

**Data and scripts to run the auto generating daily podcast feeds on tomwsmf.com**

N.B. Change all paths to point to your own directory structure, unless you are me and then...boy howdy its all golden.
Also, this is a very basic readme. Someday soon over coffe and a bagle they will get a better write up. 

So the impetus behind all this was to have podcasts of historic radio broadcasts auto generated  for myself and a few  comrades. In the years since it has been running it  has gotten a few more listeners than I thought. Shows have been added as have genre and theme based podcasts. 

The rough structure of things is this

The top directory holds podcastgen.sh, parseit.sh, the directories where each particular podcast's items are kept, and a web accesable directory where the feed and imgs are put. 


Podcastgen.sh is a bash script that will call each of the  bash scripts in the podcast directories, generate the .rss file and then put the .rss file in the web accesable  folder, which in case you are me is home/tomwsmf/tomwsmf.com/podcasts/ 
Add podcastsgen.sh  to cron so that it runs at least once a day.  

parseit.sh was made to take the http://archive.org/download/  page for a collection and parse the mp3s into a list ready, or nearly ready, for adding to a podcasts list. It needs more filters and replacments to fix for  badly made file names.  

The home/tomwsmf/tomwsmf.com/podcasts/ directory also conatins the images called for in the .rss files. 
Check the permissions of these files, just in case. 

In each podcast directory there is 

1- the bash file to generate the rss feed 

2- a list file with all the shows listed and prepared for searching

3- a toadd file for any shows that still need formating or cleanup


