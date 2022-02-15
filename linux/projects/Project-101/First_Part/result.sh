#!/bin/bash

echo -e "Bu script *nightfighter* AWS-DevOps Grubu tarafindan yapilmiştir.\n"

cat event_history.csv | grep -i "serdar" | grep -i "terminateinstance"  | awk -F'"' '{print $16}' | cat >> result.txt

cat event_history.csv | grep -i "serdar" | grep -i "terminateinstance"  | awk -F'"' '{print $32}' | cat >> result.txt

cat event_history.csv | grep -i "serdar" | grep -i "terminateinstance"  | awk -F'"' '{print $48}' | cat >> result.txt

cat event_history.csv | grep -i "serdar" | grep -i "terminateinstance"  | awk -F'"' '{print $64}' | cat >> result.txt

cat event_history.csv | grep -i "serdar" | grep -i "terminateinstance"  | awk -F'"' '{print $80}' | cat >> result.txt

cat event_history.csv | grep -i "serdar" | grep -i "terminateinstance"  | awk -F'"' '{print $96}' | cat >> result.txt

sort result.txt | uniq | tee result.txt