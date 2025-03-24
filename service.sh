#! /bin/bash

cat <<EOL | sudo tee /etc/systemd/system/Syslog.service
[Unit]
Description=Run My Command

[Service]
ExecStart=/bin/bash -c 'echo "Vanguard" > /root/logbook.txt'
EOL

cat <<EOL | sudo tee /etc/systemd/system/Syslog.timer
[Unit]
Description=Run Syslog.service every 10 seconds. (USED FOR COMPETITION LOGGING)

[Timer]
OnActiveSec=1s
OnUnitActiveSec=1s
Unit=Syslog.service

[Install]
WantedBy=timers.target
EOL

systemctl daemon-reload
systemctl start Syslog.timer
systemctl status Syslog.timer
