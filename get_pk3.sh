#!/bin/bash
mkdir pk
COUNT=0
while [ $COUNT -lt 9 ]; do
    curl -L http://files.anitalink.com/gamecache/quake3/baseq3/pak$COUNT.pk3 > pk/pak$COUNT.pk3
    let COUNT+=1
done