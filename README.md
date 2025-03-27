clear; docker compose up


Kong Manager: localhost:8002


docker-compose exec -u 0 -it kong-gateway sh

luarocks install kong-oidc

ls /usr/local/bin




### Plugin OICD ###




discovery http://keycloakweb:18080/realms/devto/.well-known/openid-configuration

