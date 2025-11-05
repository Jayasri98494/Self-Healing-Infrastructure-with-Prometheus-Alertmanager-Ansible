# Self-Healing-Infrastructure-with-Prometheus-Alertmanager-Ansible
🛠️ Self-Healing Infrastructure using Prometheus, Alertmanager & Ansible
📖 Overview

This project demonstrates a Self-Healing Infrastructure that automatically detects when a service (like NGINX) fails and restores it without human intervention.
It integrates Prometheus, Alertmanager, and Ansible in a Dockerized environment, with a Flask Webhook that triggers the healing process.

🎯 Objective

To create an automated system that:

Continuously monitors service health (NGINX).

Detects service failures using Prometheus alerts.

Automatically restarts failed services using Ansible.

🧰 Tools & Technologies
Tool	Purpose
Prometheus	Collects metrics and monitors uptime.
Alertmanager	Sends alerts when thresholds or rules are triggered.
Ansible	Executes automation scripts to heal the system.
Flask (Python)	Acts as a webhook listener for alerts.
Docker	Containerized environment for Prometheus & Alertmanager.
Ubuntu (WSL)	Local environment for automation testing.
⚙️ Architecture / Workflow
Prometheus  →  Alertmanager  →  Flask Webhook  →  Bash Script  →  Ansible  →  NGINX Restart

🔁 Flow Explanation:

Prometheus monitors NGINX health.

When NGINX stops, Prometheus triggers an alert.

Alertmanager sends this alert to the Flask Webhook (port 5001).

The Webhook runs a script (alert_webhook.sh) which triggers Ansible.

Ansible executes the healing playbook to restart NGINX automatically.

📂 Project Structure
self-healing-infra/
│
├── prometheus/
│   ├── prometheus.yml
│   └── alert_rules.yml
│
├── alertmanager/
│   └── alertmanager.yml
│
├── ansible/
│   └── heal_service.yml
│
├── alert_webhook.sh
├── webhook_listener.py
├── docker-compose.yml
└── healing_log.txt

🚀 How to Run
1️⃣ Start Docker containers:
docker compose up -d

2️⃣ Start the Flask Webhook:
python3 webhook_listener.py

3️⃣ Simulate a failure:
sudo systemctl stop nginx


Wait 20–30 seconds:

Prometheus detects failure

Alertmanager sends alert

Flask receives alert

Ansible restarts NGINX automatically ✅

🧪 Test Result

✅ When NGINX was stopped manually,
Prometheus fired an alert →
Alertmanager sent a webhook →
Flask triggered the Ansible playbook →
NGINX restarted automatically.

Outcome:

Self-Healing confirmed successfully.
