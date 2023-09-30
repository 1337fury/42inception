# Dockerfile for Redis
#...

FROM debian:bookworm

RUN apt-get update -y && apt-get install -y \
	redis-server \
&& rm -rf /var/lib/apt/lists/*

EXPOSE 6379

COPY ./tools/config.sh /tmp/config.sh

RUN chmod +x /tmp/config.sh

CMD [ "sh", "/tmp/config.sh" ]
