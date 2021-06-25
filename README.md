# azure-sonar-qube

## Terraform Script to deploy single node sonar qube on azure
1. Instalar Prerequisitos con script JVM & postgresql
1. Configuración Manual del PostgreSQL [Parte Manual]($parte-manual-1) 
1. Setup del sonar Qube con script
1. Configuración del Sonarquebe [Parte Manual](#parte-manual-2)

## Parte Manual 1

Configuración de la base de datos
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

## Parte Manual 2
Configuración del Arranque del Sonar

