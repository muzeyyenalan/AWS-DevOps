#!/bin/bash

# This script creates a new user on the local system.
# You will be prompted to enter the username (login), the person name, and a password.
# The username, password, and host for the account will be displayed.
# Make sure the script is being executed with superuser privileges.

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