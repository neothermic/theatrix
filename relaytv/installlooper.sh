#!/bin/sh

echo "Catting bashrc to add playall command"
cat ~/theatrix/relaytv/bashrc.ct >> ~/.bashrc  #appends contents of bashrc.ct to bashrc, creating the playall command as an alias

echo "Installing script into crontab"

line="@reboot screen -dmS loop bash -i ~/theatrix/relaytv/loopScript.sh"
(crontab -u pi -l; echo "$line" ) | crontab -u pi -

echo "Install complete, reboot to start playback"
