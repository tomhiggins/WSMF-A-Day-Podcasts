#!/bin/bash

# Created to parse listings of mp3s from Archive.org and turn them into
# properly formated Item lines for use in podcasts
# Use:
# archiveparser.sh urlofthe archivelisting/ 
#
# Output:
# parseditems.txt
#
# (cc) 2011-2017  TomHiggins
#

page=$1

[[ $page = *\// ]] &&  page="$page"$"/"

itemtag="<item><title>"
titletag="</title><guid>"
enclosuretag="</guid><enclosure url='"
endtag="' length='23666323' type='audio/mpeg' /><pubdate>insertdate</pubdate></item>"
echo "" >parseditems.txt

wget -O - "$page" | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//' | grep  'mp3' >templist.txt

while read -r line
do
    url="$line"
    title="${url/-/ }"
    title="${title/.mp3/}"  
    title="${title/-/ }"
    title="${title//_/ }"
    title="${title//%20/}"
    echo "$itemtag$title$titletag$page$url$enclosuretag$page$url$endtag" >>parseditems.txt
done < templist.txt

rm templist.txt


