#!/bin/sh

echo "Catting bashrc to add playall command"
cat ~/theatrix/relaytv/bashrc.ct >> ~/.bashrc  #appends contents of bashrc.ct to bashrc, creating the playall command as an alias

echo "Installing script into crontab"

line="@reboot screen -dmS loop bash -i ~/theatrix/relaytv/loopScript.sh"
(crontab -u pi -l; echo "$line" ) | crontab -u pi -
echo "Creating content folder at /home/content/"
sudo mkdir /home/content
echo "Creating content user and assigning home folder"
sudo useradd content
sudo chown content:users /home/content
echo "Install complete, add content and reboot to start playback"
echo "Run 'sudo passwd content' to set password for content manager"
