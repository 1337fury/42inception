# Dockerfile for MariaDB
# ...

FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install mariadb-server  -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/mariadb.sh /usr/local/bin/

ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]