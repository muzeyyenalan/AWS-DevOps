#!/bin/bash

# Check if we are root privilage or not
<<<<<<< HEAD
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
=======
if [[ ${UID} -ne 0 ]]
then
   echo "Please use this bash script with root privilage"
   exit 1
fi

# Which files are we going to back up. Please make sure to exist /home/ec2-user/data file
backup_files="/home/ec2-user/data /etc /boot /opt" 

# Where do we backup to. Please crete this file before execute this script
dest="/mnt/backup"

# Create archive filename based on time
time=$(date +"%Y_%m_%d_%I_%M_%p")
hostname=$(hostname -s)
archive_file="${hostname}-${time}.tgz"

# Print start status message.
echo "We will back up ${backup_files} to ${dest}/${archive_file} "
date
echo

# Backup the files using tar.
tar czf ${dest}/${archive_file} ${backup_files} # &> /dev/null (Bunu script birkaç kez calistirilip eklenebilir)

# Print end status message.
echo
echo "Congrulations! Your Backup is ready"
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest

-------------
# /etc/crontab ın içine yazılacak


# Good article -> https://www.cumulations.com/blog/how-to-write-cron-jobs-on-amazon-web-servicesaws-ec2-server/

# To set this script for executing in every 5 minutes, we'll create cronjob
```bash
crontab -e
```
- vi or nano editor will open. We will run  backup.sh script in every 5 minutes. To be able to do this we\'ll write this within opend vi or nano file

```bash
*/5 * * * * sudo /home/ec2-user/backup.sh
```

- save and exit from nano or vi

- To check whether your Cron Jobs is saved or not, run the below command.
```bash
$crontab -l
```

This part is so important:

Once an archive has been created it is important to test the archive. The archive can be tested by listing the files it contains, but the best test is to restore a file from the archive.

To see a listing of the archive contents. From a terminal prompt type:

tar -tzvf /mnt/backup/ip-172-31-89-147-2021_11_02_12_26_AM.tgz


To restore a file from the archive to a different directory enter:

tar -xzvf /mnt/backup/ip-172-31-89-147-2021_11_02_12_26_AM.tgz -C /tmp etc/hosts
The -C option to tar redirects the extracted files to the specified directory. The above example will extract the etc/hosts file to /tmp/etc/hosts. tar recreates the directory structure that it contains.

Also, notice the leading “/” is left off the path of the file to restore.

To restore all files in the archive enter the following:

cd /
sudo tar -xzvf /mnt/backup/ip-172-31-89-147-2021_11_02_12_26_AM.tgz
Note

This will overwrite the files currently on the file system.
>>>>>>> b7d09822249a83a8202b3dc11681de238138c3f6
