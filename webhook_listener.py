from flask import Flask, request
import os
import subprocess

app = Flask(__name__)

@app.route('/', methods=['POST'])
def alert():
    data = request.get_json()
    print("🚨 Alert received from Alertmanager:", data)
    os.system("bash /mnt/c/Users/jayasri1004/OneDrive/Documents/self-healing-infra/alert_webhook.sh")
    return "Healing triggered", 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)
