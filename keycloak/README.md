## Remove all running containers

docker ps
docker container rm 8abc45 -f

## Start containers

docker compose up

## Enter into the admin

localhost:8080

### Discovery uri ####
http://localhost:9080/realms/devto/.well-known/openid-configuration


### Create Client ###

dashboard  
user: admin  
pwd: admin  

create a new client:

client id: devto  
name: devto  
valid redirect url: http://localhost:3000/dashboard  
logout url: http://localhost:3000/home  
web origins: *

standard flow and direct access grants  


### Kong com Keycloak ###

Para ambos funcionarem em conjunto precisa os dois estarem no mesmo docker-compose.yml

