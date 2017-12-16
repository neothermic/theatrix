#!/bin/sh

echo "Dumping EDID data to /boot/edid.dat - This script only works correctly if connected to TV"
sudo tvservice -d /boot/edid.dat
echo "Appending rpi config file to use EDID file"
echo "hdmi_edid_file=1" >> /boot/config.txt
echo "Complete"
