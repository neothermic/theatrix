#!/bin/sh
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install subversion libfreeimage3 -y

svn export https://github.com/Hemisphere-Project/HPlayer/trunk/bin-raspbian-armv6 ~/HPlayer

sudo raspi-config
	# Expand filesystem
	# Split GPU memory to 128 or 256
	# Bootup in Console
	# Overclock if you want to (recommanded on RPi 1)
	# Reboot !
