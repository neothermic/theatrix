!#/bin/sh
ROOTUID="0"
#Use only to register clients with a new FTP master server at theatrix1. Most common case would be if theatrix1 has been replaced
if [ "$(id -u)" -ne "$ROOTUID" ] then
	echo "This script requires root"
	exit 1
fi

echo "Telling SSH to ignore strict host checking" 
cat home/pi/theatrix/relaytv/ssh_config.ct >> /etc/ssh/ssh_config  #appends line to stop strict host checking
echo Creating public/private keypair and registering it with theatrix1, what is my hostname:
read my_name
ssh-keygen -t rsa -C "$my_name key for theatrix1"
sudo cat home/pi/.ssh/id_rsa.pub | ssh pi@theatrix1.local 'cat >> .ssh/authorized_keys'
echo Registration complete - Try ssh pi@theatrix1.local to test passwordless access
