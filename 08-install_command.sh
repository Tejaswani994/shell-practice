#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Plese run with sudo access"
    exit
else
    echo "you are running with sudo access"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "Need to install mysql"
    dnf install mysql -y

    if [ $? -eq 0 ]
    then
        echo "Installing mysql is success"
    else
        echo "Installing mysql is failure"
        exit 1
    fi
    
else
    echo "no need to install mysql"
fi



#id -u--> gives only user id
#exit-->The exit command is used to terminate a shell script or session and return an exit status code.
#exit 0 means success, and non-zero values indicate failure.
#$?-->It shows the exit status (return code) of the previous command.