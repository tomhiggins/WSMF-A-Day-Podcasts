# WSMF-A-Day-Podcasts

**Data and scripts to run the auto generating daily podcast feeds on tomwsmf.com**

N.B. Change all paths to point to your own directory structure, unless you are me and then...boy howdy its all golden. 

Each podcast has a folder

In each podcast folder there is 

1- the bash file to generate the rss feed 

2- a list file with all the shows listed and prepared for searching

3- a toadd file for any shows that still need formating, dates or cleanup. 

Add podcastsgen.sh  to cron so that it runs at least once a day.  This bash script will call each of the  bash scripts in the podcast folders, generate the .rss file and then put that .rss file in the web accesable  folder, which in case you are me is home/tomwsmf/tomwsmf.com/podcasts/ This folder also conatins the images called for in the .rss files. 
Check the permissions of these files, just in case. 


parseit.sh was made to take the http://archive.org/download/  page for a collection and parse the mp3s into a list ready, or nearly ready, for adding to a podcasts list
