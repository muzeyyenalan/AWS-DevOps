#!/bin/bash

# Check if we are root privilage or not
if [[ $(whoami) == root ]]
then
  echo "You are root user"
else
  sudo su -
fi

# Which files are we going to back up. Please make sure to exist /home/ec2-user/data file
if [[ -e /home/ec2-user/data ]]
then
  echo "/home/ec2-user/data folder exist"
else
  mkdir /home/ec2-user/data
  echo "/home/ec2-user/data created"
fi

# Where do we backup to. Please crete this file before execute this script
if [[ -e /mnt/backup ]]
then
  echo "/mnt/backup folder exist"
else
  mkdir /mnt/backup
  echo "/mnt/backup created"
fi

# Create archive filename based on time
EC2USER_BACKUP="${HOSTNAME}_ec2user_data_$(date +"%Y_%m_%d_%I_%M_%p").tgz"
ETC_BACKUP="${HOSTNAME}_etc_$(date +"%Y_%m_%d_%I_%M_%p").tgz"
BOOT_BACKUP="${HOSTNAME}_boot_$(date +"%Y_%m_%d_%I_%M_%p").tgz"
USR_BACKUP="${HOSTNAME}_usr_$(date +"%Y_%m_%d_%I_%M_%p").tgz"

# Print start status message.
echo "backup process is started"

# Backup the files using tar.
tar -cvf /mnt/backup/"$EC2USER_BACKUP" /home/ec2-user/data
tar -cvf /mnt/backup/"$ETC_BACKUP" /etc
tar -cvf /mnt/backup/"$BOOT_BACKUP" /boot
tar -cvf /mnt/backup/"$USR_BACKUP" /usr

# Print end status message.
echo "backup process is ended"

# Long listing of files in $dest to check file sizes.
ls -al /root/mnt/backup

# According to the project this bash script will be executed in every 5 minutes via crontab.