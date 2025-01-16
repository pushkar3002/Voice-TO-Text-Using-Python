from flask import Flask, render_template, request, jsonify
import speech_recognition as sr

app = Flask(__name__)

def record_voice():
    microphone = sr.Recognizer()
    with sr.Microphone() as live_phone:
        microphone.adjust_for_ambient_noise(live_phone)
        print("Listening...")
        audio = microphone.listen(live_phone)
        try:
            phrase = microphone.recognize_google(audio, language='en')
            return phrase
        except sr.UnknownValueError:
            return "I didn't understand what you said"
        except sr.RequestError:
            return "API unavailable"

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/record', methods=['POST'])
def record():
    # This would simulate recording and returning a phrase
    phrase = record_voice()
    with open('you_said_this.txt', 'w') as file:
        file.write(phrase)
    return jsonify({"phrase": phrase})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)  