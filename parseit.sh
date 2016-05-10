#!/bin/bash

page=$1
itemtag="<item><title>"
titletag="</title><guid>"
enclosuretag="</guid><enclosure url='"
endtag="' length='23666323' type='audio/mpeg' /><pubdate>insertdate</pubdate></item>"


wget -O - "$page" | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//' | grep  'mp3' >templist.txt

while read -r line
do
    url="$line"
    title="${url/-/ }"
    title="${title/-/ }"
    title="${title//%20/ }"
    echo "$itemtag$title$titletag$page$url$enclosuretag$page$url$endtag"
done < templist.txt

