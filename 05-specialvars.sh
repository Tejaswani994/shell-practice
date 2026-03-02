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