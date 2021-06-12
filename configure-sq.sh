cat << EOF > /etc/systemd/system/sonar.service
[Unit]
Description=SonarQube service
After=syslog.target network.target

[Service]
Type=forking

ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
LimitNOFILE=131072
LimitNPROC=8192
User=sonar
Group=sonarGroup
Restart=always

[Install]
WantedBy=multi-user.target
EOF

cat << EOF >> /etc/sysctl.conf
vm.max_map_count=262144
fs.file-max=65536
EOF

cat << EOF >> /etc/security/limits.conf
sonar   -   nofile   65536
sonar   -   nproc    4096
EOF

sysctl -p
systemctl start sonar
systemctl enable sonar
systemctl status sonar
