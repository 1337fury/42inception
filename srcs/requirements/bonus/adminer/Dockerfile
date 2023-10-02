# Dockerfile for Adminer
# ...
FROM alpine:3.12.0

RUN apk update && apk --no-cache add \
	php7 \
	php7-session \
	php7-pdo \
	php7-pdo_mysql

RUN mkdir -p /var/www/html \
    && wget -O /var/www/html/adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-en.php

EXPOSE 8080

WORKDIR /var/www/html

RUN mv adminer.php index.php 

# Run PHP built-in web server to serve Adminer
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]