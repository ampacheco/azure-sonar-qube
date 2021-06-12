wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.1.44547.zip
apt-get -y install unzip
apt-get -y install unzip
unzip sonarqube*.zip -d /opt
mv /opt/sonarqube-8.9.1.44547 /opt/sonarqube -v
groupadd sonarGroup
useradd -c "user to run SonarQube" -d /opt/sonarqube -g sonarGroup sonar 
chown sonar:sonarGroup /opt/sonarqube -R
