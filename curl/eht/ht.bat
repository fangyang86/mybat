#!/bin/bash
addr2=""
addr1=""
while [ "$addr1" != "$addr2" ]
do
addr1=$addr2
curl -k -o o100.html $addr1
sed 's/</\n</g' o100.html | grep -i keystamp > o101.html
sed 's/http/\nhttp/g' o101.html >o102.html
sed 's/\.jpg/\.jpg\n/g' o102.html > o103.html
fn=$(grep http o103.html)
echo $fn
ofn=$(grep http o103.html | sed 's/\//\n/g' | grep -i '\.jpg')
echo $ofn
curl -o $ofn $fn
sed 's/</\n</g' o100.html | grep -i next | sort -u > o201.html
addr2=$(sed 's/https/\nhttps/g' o201.html | grep http | sed 's/\"/\n/g' | grep http)
echo $addr2
done
