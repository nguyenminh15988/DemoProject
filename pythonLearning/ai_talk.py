import pyttsx3

ai_brain = "i can't hear you, please try again"

ai_talk = pyttsx3.init()
ai_talk.say(ai_brain)
ai_talk.runAndWait()
