#!/bin/sh
echo "Installing WiFi configs"
sudo mv ~/theatrix/config_files/interfaces /etc/network/interfaces
sudo mv ~/theatrix/config_files/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf
echo "Install complete, reboot to connect"
