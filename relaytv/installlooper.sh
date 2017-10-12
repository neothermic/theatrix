#!/bin/sh
#sudo apt-get update
#echo "Installing screen"
#sudo apt-get install screen
#echo "Installing cec tools"
#sudo apt-get install cec-utils
#echo "Catting bashrc to add playall command"
#cat ~/theatrix/relaytv/bashrc.ct >> ~/.bashrc  #appends contents of bashrc.ct to bashrc, creating the playall command as an alias

#echo "Installing looper script into crontab"
#line="@reboot screen -dmS loop bash -i ~/theatrix/relaytv/loopScript.sh"
#(crontab -u pi -l; echo "$line" ) | crontab -u pi -
echo "Creating content folder at ~/theatrix/content/"
mkdir ~/theatrix/content
echo "Creating public/private keypair and registering it with theatrix1"
ssh-keygen -t rsa -C "$HOSTNAME key for theatrix1"
cat ~/.ssh/id_rsa.pub | ssh pi@theatrix1.local 'cat >> .ssh/authorized_keys'
echo "Adding rsync command to cron @reboot"
echo Enter the name of the source folder for this unit:
read ftp_source
(crontab -u pi -l; echo "@reboot sudo rsync -azvh --delete -e ssh pi@theatrix1.local:/home/content/$ftpsource/ ~/theatrix/content" ) | crontab -u pi -



echo "Install complete, add content and reboot to start playback"
