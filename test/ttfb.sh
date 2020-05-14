#!/bin/bash
# file: ttfb.sh
# curl command to check the time to first byte

# ** usage **
# 1. ./ttfb.sh 5 "https://google.com"

count=$1
endpoint=$2

# Check Arguments
if [ -z "$1" ]
  then
    echo "No count argument supplied, Default = 5"
    count=5
fi

if [ -z "$2" ]
  then
    echo "No endpoint argument supplied, Default = https://google.com"
    endpoint="https://google.com"
fi



while sleep 1; do

 for i in $(seq 1 $count); do
    echo test $i &

    curl -o /dev/null \
         -H 'Cache-Control: no-cache' \
         -s \
         -w "Status: %{http_code} Connect: %{time_connect} TTFB: %{time_starttransfer} Total time: %{time_total} \n" \
         $endpoint
 
  done

done


