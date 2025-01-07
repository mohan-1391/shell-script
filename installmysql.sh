#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
 then 
     echo "Error : user must be root user"
 exit 1     
fi

dnf list installed mysql

if [ $? -ne 0 ]
 then
    dnf install mysql -y
    if [ $? -ne 0 ]
     then
        echo "my sql instalation failed"
        exit 1
    else 
        echo "my sql installed successfully"
    fi    
else 
    echo "my sql already installed"
    fi  
dnf list installed git

if [ $? -ne 0 ]
   then
       dnf install git
       if [ $? -eq 0]
          then 
          echo "git installed sucessfully"
          fi
        else 
             echo "git installation failed"
    fi
else
   echo "git already installed"
fi           
