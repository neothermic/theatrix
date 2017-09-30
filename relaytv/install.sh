#!/bin/sh
echo "Installing RelayTV package - web server (lighttpd) and relevant files"
sudo apt-get --assume-yes install lighttpd
sudo cp ~/theatrix/relaytv/index.html /var/www/html/index.html
sudo cp ~/theatrix/relaytv/doStuff.py /var/www/doStuff.py
echo "Install finished, launching web server"
sudo service lighttpd start
echo "Complete, server started"
