import speech_recognition

ai_listen = speech_recognition.Recognizer()
with speech_recognition.Microphone() as mic:
	print("AI: i'm listening")
	audio = ai_listen.listen(mic)

you = ai_listen.recognize_google(audio)
print(you)