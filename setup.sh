apt-get update && sudo apt-get install default-jdk -y
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
apt-get -y install postgresql postgresql-contrib
systemctl start postgresql
systemctl enable postgresql
