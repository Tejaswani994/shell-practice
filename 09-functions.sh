#!/bin/bash
#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR:: Plese run with sudo access"
    exit
else
    echo "you are running with sudo access"
fi


VALIDATE [ $1 -eq 0 ]
then
    echo "Installing $2 is success"
else
    echo "Installing $2 is failure"
    exit 1
fi

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
