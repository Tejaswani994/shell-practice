#!/bin/bash

# ensure script is run with root privileges
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run with sudo access"
    exit 1
else
    echo "you are running with sudo access"
fi

#----------------------------------------------------------------
# helper function to validate the exit status of a command
# Usage: VALIDATE <exit_code> <package_name>
#----------------------------------------------------------------
VALIDATE() {
    if [ "$1" -eq 0 ]
    then
        echo "Installing $2 is success"
    else
        echo "Installing $2 is failure"
        exit 1
    fi
}


dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Need to install mysql"
    dnf install mysql -y
    VALIDATE $? "mysql" 
else
    echo "no need to install mysql"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "Need to install python3"
    dnf install python3 -y
    VALIDATE $? "python3"   
else
    echo "no need to install python3"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "Need to install nginx"
    dnf install nginx -y
    VALIDATE $? "nginx" 
    
else
    echo "no need to install nginx"
fi
