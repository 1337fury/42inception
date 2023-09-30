# Dockerfile for Redis
#...

FROM debian:bookworm

RUN apt-get update -y \
&& apt-get install redis-server -y

EXPOSE 6379

COPY ./tools/config.sh /tmp/config.sh

RUN chmod +x /tmp/config.sh

CMD ["bash", "/tmp/config.sh"]
