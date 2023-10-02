# Dockerfile for webiste
# ...
FROM debian:bookworm

RUN apt-get update -y && apt-get install -y \
	nginx \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/nginx

COPY conf/default /etc/nginx/sites-available/default

COPY ./content /var/www/content

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
