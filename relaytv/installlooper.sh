#!/bin/sh

echo "Catting bashrc to add playall command"
cat ~/theatrix/relaytv/bashrc.ct >> ~/.bashrc  #appends contents of bashrc.ct to bashrc, creating the playall command as an alias

echo "Installing script into crontab"

line="@reboot screen -dmS loop bash -i ~/theatrix/relaytv/loopScript.sh"
(crontab -u pi -l; echo "$line" ) | crontab -u pi -
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
echo "Install complete, add content and reboot to start playback"
