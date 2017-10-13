#!/bin/sh
while ! ping -c 1 -W 1 8.8.8.8; do
    echo "Waiting for 8.8.8.8 - network interface might be down..."
    echo "Waiting for 8.8.8.8 - network interface might be down..." >/dev/tty1 #echo to display
    sleep 1
done
echo "Syncing..." >/dev/tty1 #echo to display

