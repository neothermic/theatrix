import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)

GPIO.setup(17, GPIO.OUT)
GPIO.setup(27, GPIO.OUT)
GPIO.setup(22, GPIO.OUT)

GPIO.output(17, GPIO.HIGH)
GPIO.output(27, GPIO.HIGH)
GPIO.output(22, GPIO.HIGH)

while (True):
	key = raw_input("Enter 'i' for on, 'o' for off, any key to quit. Enter after each character:")
	
	if key == "i":
		GPIO.output(17, GPIO.LOW)
		GPIO.output(27, GPIO.LOW)
		GPIO.output(22, GPIO.LOW)

	elif key == "o":
		GPIO.output(17, GPIO.HIGH)
		GPIO.output(27, GPIO.HIGH)
		GPIO.output(22, GPIO.HIGH)

	else:
		break




GPIO.cleanup()
