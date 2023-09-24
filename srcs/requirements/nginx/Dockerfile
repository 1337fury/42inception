# Dockerfile for Nginx
FROM debian:bookworm

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx vim curl openssl 2> /dev/null

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/fury.crt -keyout /etc/nginx/ssl/fury.key -subj "/C=MA/ST=Tetouan/L=Martil/O=42/OU=1337/CN=abdeel-o.42.fr/UID=abdeel-o"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
