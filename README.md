# theatrix
Network solutions to various problems solved without use or access to corporate network infrastructure

Modules:
	relaytv/install/sh
		Installs lighttpd web server
		Installs python-flup for cgi interaction
		Creates an admin copy of python to to execute scripts (GPIO requires root)
		Copies lighttpd config file
		Copies web page and python script into place
		Starts webserver
			Reboot seems to be required before scripts work, possibly something to do with the use of the root python?

	prompt/
	`	Control of relaytv
		
	watch/
		CCTV Viewer
		COnsider priviledges of each individual watch module?

	eyeball/
		CCTV Camera
		Optional night vision modes selectable by changing camera module used
		Receivable by watch/ modules

	tv/
		TV Content server
		Advert loops to be played as required
		Receiver for targeted streams for presentaion relay
		HDMI-CEC compatibility and control.
		
		
