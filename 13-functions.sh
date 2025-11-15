#!/bin/bash

USERID=$ (id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: You must run this script as root user."
    exit 1 # failure is other than 0
fi

VALIDATE() { # FUNCTIONS RECEIVE INPUTS THROUGH ARGS JUST LIKE SHELL ARGUMENTS

if [ $1 -ne 0]; then
    echo "ERROR:: Installing $2 failed."
    exit 1
else
    echo "Installing $2 SUCCESS"    
fi

}   # END OF FUNCTION  

dnf install mysql -y
VALIDATE $? "MySQL"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install python3 -y
VALIDATE $? "Python3"
