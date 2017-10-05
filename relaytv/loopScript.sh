
#!/bin/sh
echo "tx 10:44:6D" | cec-client RPI -s -d 4
cd ~/theatrix/content
fbi -a ~/theatrix/resources/swanlogo.png
playall
