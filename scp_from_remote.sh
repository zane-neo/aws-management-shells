#!/bin/bash

if [ -z "$1" ]
then
  echo 'missing instance info!'
  exit 0
fi

if [ -z "$2" ]
then
  echo 'missing remote path info!'
  exit 1
fi
echo 'start scp -i ~/zaniu-ec2-nopass.pem ec2-user@'$1':'$2' .' 
scp -i ~/zaniu-ec2-nopass.pem ec2-user@$1:$2 .
