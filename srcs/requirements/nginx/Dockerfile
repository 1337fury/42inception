# Dockerfile for Nginx
FROM debian:buster

RUN apt update && apt install -y nginx vim curl openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/fury.crt -keyout /etc/nginx/fury.key -subj = "/C=FR/ST=IDF/L=Safi/O=42/OU=42/CN=abdeel-o.42.fr/UID=abdeel-o"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "doemon off;"]