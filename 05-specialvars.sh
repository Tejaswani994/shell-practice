#!/bin/bash
echo "All variables passed to the script: $@"
echo "No of variables passed to the script: $#"
echo "script name: $0"
echo "Current directory: $PWD"
echo "User running the script: $USER"
echo "Home Directory of user: $HOME"
echo "PID of the script: $$"
sleep 10 &
echo "PID of last command in background: $!"
echo "Exit status of the last executed command: $?"





#INPUT::sh 05-specialvars.sh TEJA CHINNI
#OUTPUT::
#All variables passed to the script: TEJA CHINNI
#No of variables passed to the script: 2
#script name: 05-specialvars.sh
#Current directory: /root/shell-practice
#User running the script: root
#Home Directory of user: /root
#PID of the script: 1588
#PID of last command in background: 1589
#Exit status of the last executed command: 0
