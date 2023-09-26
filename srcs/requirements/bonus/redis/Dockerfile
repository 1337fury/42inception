# Dockerfile for Redis
#...

FROM debian:bookworm

RUN apt-get update -y \
    && apt-get upgrade -y

RUN apt-get install redis-server -y

EXPOSE 6379

COPY ./tools/config.sh /tmp/config.sh

RUN chmod +x /tmp/config.sh

ENTRYPOINT ["bash", "/tmp/config.sh"]

CMD ["redis-server", "/etc/redis/redis.conf"]
