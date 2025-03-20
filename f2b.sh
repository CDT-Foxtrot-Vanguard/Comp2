#!/bin/bash

# Update package list and install Fail2ban
echo "Updating package list and installing Fail2ban..."
sudo apt update && sudo apt install -y fail2ban

# Create or edit the jail.local configuration file
echo "Configuring Fail2ban for SSH..."
cat <<EOL | sudo tee /etc/fail2ban/jail.local
[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 3
bantime = 3600
findtime = 600
allowipv6 = false
maxmatches = 5
EOL

sudo systemctl restart fail2ban
