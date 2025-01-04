#!/bin/bash
NUMBER1=$1
NUMBER2=$2
TIMESTAMP=$(date)

echo "exicuted time is = $TIMESTAMP"
SUM=$(($NUMBER1 + $NUMBER2))

echo "sum of number1 and number2=$SUM"