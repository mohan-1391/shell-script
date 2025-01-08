#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

LOG_FOLDER="/var/log/shellscript.log"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%y-%m_%d-%H-%M)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE/$TIMESTAMP.log"

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

VALIDATE(){ 
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $R FAILURE"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1 #other than 0
fi

dnf list installed mysql 

if [ $? -ne 0 ]
then # not installed
    dnf install mysql -y  &>>$LOG_FILE_NAME
   $VALIDATE $? "INSTALLING MY SQL"
else
    echo -e "MySQL is already ...$Y INSTALLED"
fi

# if [ $? -ne 0 ]
# then
#     echo "Installing MySQL ... FAILURE"
#     exit 1
# else
#     echo "Installing MySQL ... SUCCESS"
# fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATE $? "installing git"
else
    echo -e "Git is already ...$Y INSTALLED"
fi