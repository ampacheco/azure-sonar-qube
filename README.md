# azure-sonar-qube

## Provisionar azure Linux VM para Desplegar sonarqube y abrir puerto adecuado
````
vname=sonarqube
az group create -n ${vname}-rg
az vm create --name ${vname}-vm --resource-group ${vname}-rg --image UbuntuLTS --admin-username azureadmin
az vm open-port --name ${vname}-vm --resource-group ${vname}-rg --port 9000
````

## Terraform Script to deploy single node sonar qube on azure
1. Instalar Prerequisitos con script JVM & postgresql
````
curl -sLo - https://raw.githubusercontent.com/ampacheco/azure-sonar-qube/main/setup.sh | sudo bash -
````
3. Configuración Manual del PostgreSQL [Parte Manual](#parte-manual-1) 
4. Setup del sonar Qube con script
````
curl -sLo - https://raw.githubusercontent.com/ampacheco/azure-sonar-qube/main/setup-sq.sh |sudo bash -
````
5. Configuración del Sonarquebe [Parte Manual](#parte-manual-2)
1. Configurar Sonarqube script
````
curl -sLo - https://raw.githubusercontent.com/ampacheco/azure-sonar-qube/main/configure-sq.sh |sudo bash -
````

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

Modificar sonar.properties
````
# Modify sonar.properties file
cat << EOF | sudo tee -a /opt/sonarqube/conf/sonar.properties
sonar.jdbc.username=sonar
sonar.jdbc.password=password
sonar.jdbc.url=jdbc:postgresql://localhost/sonarqube
# EOF
````

Especificar usuario
sudo vi /opt/sonarqube/bin/linux-x86-64/sonar.sh
# uncomment
# RUN_AS_USER=sonar
