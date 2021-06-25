# azure-sonar-qube

## Terraform Script to deploy single node sonar qube on azure
1. Instalar Prerequisitos con script JVM & postgresql
1. Configuración Manual del PostgreSQL [Manual Part](#manual-part) 
1. Setup del sonar Qube con script
1. Configuración del Sonar-Q

## Manual Part
````
# Login as postgres user
sudo su - postgres

# Now create a user below by executing below command
createuser sonar

# Switch to sql shell by entering 
psql
# Execute the below three lines (one by one)
ALTER USER sonar WITH ENCRYPTED password 'password';
CREATE DATABASE sonarqube OWNER sonar;
GRANT ALL PRIVILEGES ON DATABASE sonarqube to sonar;
# Exit psql
\q
````
