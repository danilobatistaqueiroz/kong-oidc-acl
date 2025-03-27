apenas configurar a environmnent variable KONG_PLUGINS com kong-oidc não funciona, não tem internet para instalar o plugin

entrar com `docker-compose exec -u 0 -it kong-gateway sh` e instalar na mão com `luarocks install kong-oidc` não reflete no dashboard do kong

criar uma imagem com o plugin instalado parece ser a solução

fiz manutenção para adaptar o plugin para a nova versão do kong que não aceita mais o módulo basic.

