#!/bin/sh
sudo apt-get update
echo "Installing screen"
sudo apt-get install screen
echo "Installing cec tools"
sudo apt-get install cec-utils
echo "Catting bashrc to add playall command"
cat ~/theatrix/relaytv/bashrc.ct >> ~/.bashrc  #appends contents of bashrc.ct to bashrc, creating the playall command as an alias

echo "Installing looper script into crontab"
line="@reboot screen -dmS loop bash -i ~/theatrix/content/loopScript.sh"
(crontab -u pi -l; echo "$line" ) | crontab -u pi -
echo "Creating content folder at ~/theatrix/content/"
mkdir ~/theatrix/content
echo Creating public/private keypair and registering it with theatrix1, what is my hostname:
read my_name
ssh-keygen -t rsa -C "$my_name key for theatrix1"
cat ~/.ssh/id_rsa.pub | ssh pi@theatrix1.local 'cat >> .ssh/authorized_keys'
echo "Moving loopScript to ~/theatrix/content/ - This directory is gitignored"
cp ~/theatrix/relaytv/loopScript.sh ~/theatrix/content/loopScript.sh
echo "Adding rsync command to loopscript"
echo Enter the name of the source folder for this unit:
read ftp_source
echo 'rsync -azvh --delete --progress -e ssh pi@theatrix1.local:/home/content/$ftp_source/ ~/theatrix/content' >> ~/theatrix/content/loopScript.sh
echo "Catting rest of loopscript together"
cat ~/theatrix/relaytv/loopScript.ct >> ~/theatrix/content/loopScript.sh  
#Appends remainder of original loopscript, now in to-cat file, to content script
echo "Install complete, add content and reboot to start playback"
