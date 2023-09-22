# Dockerfile for MariaDB
# ...

FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install mariadb-server  -y

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/mariadb.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/mariadb.sh

ENTRYPOINT [ "bash", "/usr/local/bin/mariadb.sh" ]