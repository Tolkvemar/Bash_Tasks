#!/bin/bash

echo "Most ip requests"
awk '{ print $1}' example_log.log | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}'
echo ""
echo "Most requested page"
awk {'print $7'} example_log.log | sort | uniq -c | sort -nr | head -1
echo ""
echo "Many requested page from ip"
awk '{ print $1}' example_log.log | sort | uniq -c | sort -nr 
echo ""
echo "Non-existent pages"
grep " 404 " example_log.log | cut -d ' ' -f 7 | sort | uniq -c | sort -nr
echo ""
echo "Time did site get the most requests"
awk '{ print $4}' example_log.log | sort | uniq -c | sort -nr | head -n 1 
#awk '{print $4}' example_log.log | cut -d: -f1 | uniq -c
echo ""
echo "Search bots have accessed the site (UA + IP)"
cat example_log.log | awk '{$2=$3=$4=$5=$6=$7=$8=$9=$10=$11=""; $0=$0; $1=$1; print}' | sort | uniq | grep bot
