#!/usr/bin/pythonRoot
# bring in the libraries
import RPi.GPIO as G     
from flup.server.fcgi import WSGIServer 
import sys, urlparse
import os #required to send CEC command later

# set up our GPIO pins
G.setmode(G.BCM)
G.setup(17, G.OUT)
G.setup(22, G.OUT)
G.setup(27, G.OUT)

G.output(17, True)
G.output(22, True)
G.output(27, True)

# all of our code now lives within the app() function which is called for each http request we receive
def app(environ, start_response):
  # start our http response 
  start_response("200 OK", [("Content-Type", "text/html")])
  # look for inputs on the URL
  i = urlparse.parse_qs(environ["QUERY_STRING"])
  yield ('&nbsp;') # flup expects a string to be returned from this function
  # if there's a url variable named 'q'
  if "q" in i:
    if i["q"][0] == "o": 
      G.output(17, True)   # Turn it off and switch channel
      G.output(22, True)
      G.output(27, True)
      os.system('echo "tx 10:44:6D" | cec-client RPI -s -d 4') #cec command to change to HDMI3

    elif i["q"][0] == "i":
      G.output(17, False)  # Turn it on
      G.output(22, False)
      G.output(27, False)

#by default, Flup works out how to bind to the web server for us, so just call it with our app() function and let it get on with it
WSGIServer(app).run()
