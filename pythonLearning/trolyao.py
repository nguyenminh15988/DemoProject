import speech_recognition
import pyttsx3
from datetime import date

#khai bao bien
ai_listen = speech_recognition.Recognizer()
ai_talk = pyttsx3.init()
ai_brain = ""

while True:
	#listen
	with speech_recognition.Microphone() as mic:
		print("AI: i'm listening")
		audio = ai_listen.listen(mic)
	print("AI: ...")

	try:
		you = ai_listen.recognize_google(audio)
	except:
		you = ""
	print("You:" + you)

	#AI
	if you == "":
		ai_brain = "I can't hear you, please try again"
	elif "hello" in you:
		ai_brain = "hello Minh dep trai"
	elif "today" in you:
		today = date.today()
		ai_brain = today.strftime("%B %d, %Y")
	elif "president" in you:
		ai_brain = "Joe Biden"
	elif "about" in you:
		ai_brain = "You are handsome :)"
	elif "bye" in you:
		ai_brain = "Bye Minh dep trai"
		ai_talk.say(ai_brain)
		ai_talk.runAndWait()
		break
	else:
		ai_brain = "I can't hear you, please try again"

	print("AI:" + ai_brain)


	#talk
	ai_talk.say(ai_brain)
	ai_talk.runAndWait()