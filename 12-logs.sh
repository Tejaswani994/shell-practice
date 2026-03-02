#!/bin/bash

# path to log file (adjust as needed)
LOGFILE="/var/log/my_script.log"

# function to log messages with timestamp
log() {
    local msg="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $msg" | tee -a "$LOGFILE"
}

# ensure script is run with root privileges
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    log "ERROR:: Please run with sudo access"
    exit 1
else
    log "running with sudo access"
fi

#----------------------------------------------------------------
# helper function to validate the exit status of a command
# Usage: VALIDATE <exit_code> <package_name>
#----------------------------------------------------------------
VALIDATE() {
    if [ "$1" -eq 0 ]
    then
        log "Installing $2 is success"
    else
        log "Installing $2 is failure"
        exit 1
    fi
}


dnf list installed mysql
if [ $? -ne 0 ]
then
    log "Need to install mysql"
    dnf install mysql -y
    VALIDATE $? "mysql" 
else
    log "no need to install mysql"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    log "Need to install python3"
    dnf install python3 -y
    VALIDATE $? "python3"   
else
    log "no need to install python3"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    log "Need to install nginx"
    dnf install nginx -y
    VALIDATE $? "nginx" 
    
else
    log "no need to install nginx"
fi
