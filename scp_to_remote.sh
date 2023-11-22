#!/bin/bash

if [ -z "$1" ]
then
  echo 'missing local file path info!'
  exit 0
fi

if [ -z "$2" ]
then
  echo 'missing instance info!'
  exit 1
fi
echo 'scp -i ~/zaniu-ec2-nopass.pem' $1 'ec2-user@'$2':~/'
scp -o StrictHostKeyChecking=no -i ~/zaniu-ec2-nopass.pem $1 ec2-user@$2:~/
