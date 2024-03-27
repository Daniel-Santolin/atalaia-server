FROM php:8.2-apache

RUN apt update \
    # && apt install -y \
    && docker-php-ext-install pdo pdo_mysql \
    && apt-get install -y mariadb-client

WORKDIR /atalaia-server

# Criando uma variável de ambiente para carregar a porta (variáveis do momento de build)
ARG PORT_BUILD=8080
# Enviando a porta para a aplicação (variáveis do container)
ENV PORT=$PORT_BUILD
# Expondo a porta (ainda é necessário associar ela a uma porta no destino)
EXPOSE $PORT_BUILD

COPY src/ /var/www/html/

# RUN apt-get update
# RUN apt-get install -y mariadb-client

# CMD ["php", "-S", "0.0.0.0:80", "index.php"]
