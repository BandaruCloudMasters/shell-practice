#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "ERROR: You must run this script as root user."
    exit 1 # failure is other than 0
fi
echo "Updating the package repository..."

dnf install mysql -y
echo "MySQL installation completed."

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing MySQL failed."
    exit 1
else
    echo "MySQL installed successfully."    
fi
