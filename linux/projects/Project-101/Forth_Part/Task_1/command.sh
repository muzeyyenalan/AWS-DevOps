#!/bin/bash

sed -i "s/ec2-private_ip/$(cat info.json | grep PrivateIpAddress | cut -d'"' -f4 | sort -u | sed '1d')/ig" terraform.tf
