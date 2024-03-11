FROM php:8.2-cli

RUN apt-get update
RUN apt-get install -y mariadb-client

COPY . .

CMD ["php", "-S", "0.0.0.0:80", "index.php"]