#!/bin/sh
echo "Installing pure-ftpd"
sudo apt-get install pure-ftpd
echo "Setting up ftp users"
sudo groupadd ftpgroup
sudo useradd ftpuser -g ftpgroup -s /sbin/nologin -d /dev/null
sudo mkdir /home/content
sudo chown -R ftpuser:ftpgroup /home/content
echo "Please enter a password for the new FTP user 'content'"
sudo pure-pw useradd content -u ftpuser -g ftpgroup -d /home/content -m
sudo pure-pw mkdb
sudo ln -s /etc/pure-ftpd/conf/PureDB /etc/pure-ftpd/auth/60puredb
sudo service pure-ftpd restart
echo "Install complete, reboot to enable and then add content"