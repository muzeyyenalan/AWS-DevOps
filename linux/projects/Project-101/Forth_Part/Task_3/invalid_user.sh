#!/bin/bash

echo "The names of the invalid users: "
cat auth.log | grep -i invalid | awk '{print $9}' | grep -v "from" | grep -v "invalid" | sort -u

echo "The attack number to our system: "
cat auth.log | grep -i invalid | awk '{print $9}' | grep -v "from" | grep -v "invalid" | wc -l

echo "The names of the invalid users and attack times: "
cat auth.log | grep -i "invalid user" | awk '{print $9}' | grep -v 'from' | grep -v 'invalid' | sed s/' '/\\n/g | sort | uniq -c | sort -nr
