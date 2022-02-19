#!/bin/bash

# This script creates a new user on the local system.
# You will be prompted to enter the username (login), the person name, and a password.
# The username, password, and host for the account will be displayed.
# Make sure the script is being executed with superuser privileges.
<<<<<<< HEAD

# Get the username (login).
read -p "Enter your username: " username

# Get the real name (contents for the description field).
read -p "Enter your real name: " comment

# Get the password.
read -p "Define a default password to user: " password

# Create the account.
echo $username
sudo useradd -c "$comment" $username

# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been.
if [[ $(echo $?) == 0 ]]
then
        echo "useradd command succeeded"
else
        echo "useradd command is not succeeded"
fi

# Set the password.
echo $password | sudo passwd $username --stdin

# Check to see if the passwd command succeeded.
if [[ $(echo $?) == 0 ]]
then
        echo "passwd command succeeded"
else
        echo "passwd command is not succeeded"
fi

# Force password change on first login.
sudo passwd -e $username

# Display the username, password, and the host where the user was created.
echo -e "Your username: $username
Your password: $password
Hostname : $HOSTNAME"
=======
if [[ "${UID}" -ne 0 ]]
then
   echo 'Please run this script with sudo or as root.'
   exit 1
fi

# Get the username (login).
read -p 'Enter the username to create: ' USER_NAME

# Get the real name (contents for the description field).
read -p 'Enter the name of the person or application that will be using this account: ' COMMENT

# Get the password.
read -sp 'Enter the password to use for the account: ' PASSWORD

# Create the account.
useradd -c "${COMMENT}" -m ${USER_NAME} 2> /dev/null 

# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been.
if [[ "${?}" -ne 0 ]]
then
  echo 'This username is already exit. Please select different username '
  exit 1
fi

# Set the password.
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Check to see if the passwd command succeeded.
if [[ "${?}" -ne 0 ]]
then
  echo 'The password for the account could not be set.'
  exit 1
fi

# Force password change on first login.
passwd -e ${USER_NAME}

# Display the username, password, and the host where the user was created.
echo
echo 'username:'
echo "${USER_NAME}"
echo
echo 'password:'
echo "${PASSWORD}"
>>>>>>> b7d09822249a83a8202b3dc11681de238138c3f6
