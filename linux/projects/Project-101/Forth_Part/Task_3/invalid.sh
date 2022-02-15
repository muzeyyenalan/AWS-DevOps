#!/bin/bash


#invalid usert number
cat auth.log | grep -i invalid | awk '{print $9}' | grep -v "from" | grep -v "invalid" | sort -u




#invalid usert name
cat auth.log | grep -i invalid | awk '{print $9}' | grep -v "from" | grep -v "invalid" | wc -l



