# Project-101 : Backup, User and Group Management, String Manipulation with Linux Commands and Bash Scripting

## Description

This project has faced real life linux command line problems. You are working the Firm as DevOps and Cloud Engineer. The infrastructure of Firm is launched AWS. 

## Problem Statement
You will be working on different company very soon. Each company has own needs. In this project, you will be working in different roles and you will be assigned some tasks which have backing up, security issues, user and password management, and some string manipulation duties. Sometimes, you need to prepair some bash script files or you need to execute some commands to be able to fulfill those tasks. There are four tasks. Manager's instructions belonging those can be found below. Please read carefully and fulfill the requirements. Good Luck!

## Part 1: Security Issue
Imagine that one of our instances has been terminated by one of firm’s personals inside. That instance was very important for firm's web-app and your infrastructure has been affected with this termination. Your team lead is suspecting `Serdar` user. You have assigned to find instances' ids  terminated by `Serdar` user and save their names in `result.txt` file. You have Cloudtrail event history file named `event_history.csv`. Instance ids within this event history look like `i-0c127ab5cdf997cf4`. You have to apply some filtering and string manipulation commands to find these. At the end of this project, to be able to handle this kind of tasks, you decided to create a bash script. Please handle this task with linux commands at first, and create bash script. 

## Part 2: User and Password Script
You're working as a System Administrator for a e-commerce company. The latest company initiative requires you to write an ansible file for dozens of servers. You're falling behind schedule and are going to miss your deadline for these ansible files because you are constantly being interrupted by the HR calling you to create new Linux accounts for all the people in the company who have been recruited to test out the company's newest Linux-based application.

In order to meet your deadline and keep your sanity, you decide to write a shell script that will create new user account and automatically generate a password for each of new account. Once you're done with the shell script you can put the HR in charge of creating new accounts which will finally allow you to work uninterrupted and complete your server deployments on time. 

Your script accepts user account name and comments as parameter. Then create a new user and a password for them. At the same time, you want users to change their password, when they login the system at the first time. Please create this bash scripting file named `user_password.sh`. 

## Part 3: Baking up and Cronjob

Imagine that you are working in Gaming company as DevOps. Recently, and you have deployed new version of firm's famous Game and it's content are kept under `/home/ec2-user/data` in minute basis. In addition, your manager asked you to be backed `/etc`, `/boot`, and `/usr` up as well. So, `/home/ec2-user/data`, `/etc`, `/boot`, and `/usr` folders need to be backed up and placed in specific folder `/mnt/backup` in every 5 minutes. At the same time, since you should separate each file from others, you have to assign different name to backup files based on hostname of instance and the date-hour-minute of the backup. Each backup file has to be compressed with `.tgz` extension. You can not manage this dynamic process by yourself. You decided to create a bash script and define cronjob for executing this in every 5 minutes. Files which are  `/home/ec2-user/data`, `/etc`, `/boot`, `/usr` have to be backed up. Please write a bash script named `backup.sh` for this task.

## Part 4: String Manipulation

You are working in Healthcare Company as DevOps engineer. Recently, you have been assigned some tasks by your manager. This part has 3 different tasks. Please follow the problem statements. 

### Task 1: 
You are writing an ansible playbook file and an ec2 instance is created one part of it. Than you have a description file named `info.json` belonging to newly created ec2 instance. Some steps later, to be able to create a git repository with `terraform.tf` file, you need to pass private IP of newly created ec2 instance to environmental variable which is `ec2_private_ip` on the line 40. You must not open `terraform.tf` file and paste the IP taken from `info.json` in related part. You have to do all those acts with linux commands and you must not open terraform and json files. Please take the private IP of EC2 instance from ec2 description file (`info.json`) and change the `ec2_private_ip` value with it within `terraform.tf` file. 


### Task 2:
Again you are writing an Ansible playbook file. In one part of that file, a pem key is created and app gives you that file one line format like `certificate.pem`. You have to turn it into multi line format to use it in another place of ansible file. Please get that `certificate.pem` one line pem key file and create and copy its multiline format in `new.pem` file. 

### Task 3: 

You have audit log file which has ssh connection logs to your server. However some invalid users try to connect your system. You have been assigned a task to find their names and how many times have they tried to attack your system. Please find it and put it into the `invalid_user.sh`file. 

## Project Skeleton 

```
Linux_Projects (folder)

|----First_Part
|--------event_history.csv        # Given to the students
|--------result.txt               # To be delivered by students 
|--------script.sh                # To be delivered by students  

|----Second_Part
|--------user_password.sh         # To be delivered by students

|----Third_Part                   
|--------backup.sh                # To be delivered by students

|----Forth_Part
|--------Task_1
|------------info.json            # Given to the students
|------------terraform.tf         # Given to the students
|------------command.sh           # To be delivered by students  
|--------Task_2
|------------certificate.pem      # Given to the students
|------------new.pem              # To be delivered by students
|--------Task_3                   
|------------auth.log             # Given to the students
|------------invalid_user.sh      # To be delivered by students
```

### At the end of the project, following topics are to be covered;

- Bash Scripting

- Sed Command

- Grep Command

- Awk Command

- Cut Command

- Uniq Command

- String Manipulation

## Resources

- [Grep, Sed, Awk, Cut Commands](https://blog.knoldus.com/play-with-text-in-linux-grep-cut-awk-sed/)

- [Bash Scripting](https://linuxconfig.org/bash-scripting-tutorial-for-beginners)

- [Uniq Comand](https://www.geeksforgeeks.org/uniq-command-in-linux-with-examples/)


