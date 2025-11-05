#!/bin/bash
LOGFILE="/mnt/c/Users/jayasri1004/OneDrive/Documents/self-healing-infra/healing_log.txt"
echo "[$(date)] ⚠️ Alert received — running Ansible playbook..." >> $LOGFILE
ansible-playbook /mnt/c/Users/jayasri1004/OneDrive/Documents/self-healing-infra/ansible/heal_service.yml >> $LOGFILE 2>&1
echo "[$(date)] ✅ Healing action completed." >> $LOGFILE
#!/bin/bash
echo "⚠️ Alert received — running Ansible playbook for healing..."
ansible-playbook /mnt/c/Users/jayasri1004/OneDrive/Documents/self-healing-infra/ansible/heal_service.yml
