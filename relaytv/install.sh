#!/bin/sh
echo "Installing RelayTV package - web server (lighttpd) and relevant files"
sudo apt-get --assume-yes install lighttpd #install webserver
sudo apt-get --assume-yes install flup #install flup

#Setup admin version of python
sudo cp /usr/bin/python2.7 /usr/bin/pythonRoot
sudo chmod u+s /usr/bin/pythonRoot

#copy files in
sudo cp ~/theatrix/relaytv/index.html /var/www/html/index.html
sudo cp ~/theatrix/relaytv/doStuff.py /var/www/doStuff.py
sudo chmod +x /var/www/doStuff.py #allow execution of the script
echo "Install finished, launching web server"
sudo service lighttpd start
echo "Complete, server started"
