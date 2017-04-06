# WSMF-A-Day-Podcasts

**Data and scripts to run the auto generating daily podcast feeds (RSS and M3U)**

# The Pitch
The impetus behind all this was to have podcasts of historic radio broadcasts auto generated  for myself and a few  comrades.The shows offered would be ones that were broadcast on that day in history.  In the years since it has been running the podcasts  have gotten a few more listeners than I thought. Shows have been added as have genre and theme based podcasts. 

By creating lists of the shows I wanted to offer up and a script to pluck the right ones for each day the whole process went from a daily chore to a bit of set up once and the hands off thereafter. 

# How It Works
The rough structure of the setup follows......

The **feeds** directory contains .info files for each podcast your run. The .info file contain tags that describe your podcast and point to the file of **enclosure tags** that will be pulled to make up the daily feeds. **NB** I have included the file ** 	podcasttemplate.txt** to use in making the info files. Just fill in the tags with your information. Make one for each podcast. 

The **lists** directory contains the files of **enclosure tags** that will make up the pool of items from which  the podcasts RSSs will be generated.  These files can be generated in whole or in part by the **parseit.sh** script. **NB** to have the right files be picked on the right days include the month and day (MM DD) somewhere in your **Title** tag, for example  *<title>Jeam Shepherd WOR SHow 1964 05 06</title>*

**dailygenerator.sh** should be croned to run once a day. This code will go thru the **feeds** directory and for each podcast info file it finds  it will generate a valid RSS file from the list of **Enclosure Tags** found in a file in the **lists** directory.  The resulting RSS and M3U files are placed in the directory under your website and also in the **DailyFeeds** directory. 
If you are not running this where you  host your podcasts you will need to move the files from **DailyFeeds** to your hosting server. If there is a call for it I can code a module to cover various hosting needs.  

# Tools

**archiveparser.sh** was made to take the http://archive.org/download/  page for a collection hosted on Archive.Org and parse the mp3s into a list ready, or nearly ready, for adding to a podcasts list. The file **patseditems.txt** is the result and will most likely need hand/regex cleanup to fix for  badly named **Title** tags

**podcastsbackup.sh** will back up all the files and directories that make up the whole operation. They are dated and zipped.

**yearlygenerator.sh** is a WIP that generated dated archival feeds for a particular feed. It will be made more generic soon. 

The **tomwsmf.com/podcasts/** directory is an example of what your structure might look like under your web servers directories.  This is how I have set up mine. The directory should hold all the JPG/GIF images called for in your podcasts .info file. This will be the place the daily  RSS and M3U files will land and will be the URLS you give out to others so that they can subscribe to your podcasts.  The contents of the RSS and M3U files will change each day but the name will remain the same. 
Under this directory I have an Archival directory for dated  RSS and M3Us of a particular podcast I run.  

