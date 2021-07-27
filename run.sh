#!/bin/bash

if ! [[ -d env ]];then
  echo "virtualenv directory \"env\" does not exist! Please create by running: virtualenv env"
  exit 1
fi

if ! [[ -f requirements.txt ]];then
  echo "requirements.txt file does not exist! Please create by running pip3 freeze > requirements.txt"
  exit 1
fi

if ! command -v waitress-serve &>/dev/null;then
  echo "waitress-serve is not installed! Install by running pip3 install waitress"
  exit 1
fi

my_ip=$(curl -s icanhazip.com)

echo "************************************************************************************"
echo "You can now test the application by browsing to this URL: http://${my_ip}:8080/yossi"
echo "************************************************************************************"

waitress-serve application:application
