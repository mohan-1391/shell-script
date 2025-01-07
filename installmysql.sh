#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
 then 
     echo "Error : user must be root user"
 exit 1     
fi
dnf install list mysql
if [ $? -ne 0 ]
 then
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "my sql instalation failed"
        exit 1
    else 
        echo "my sql installed successfully"
else 
    echo "my sql already installed"
    fi            