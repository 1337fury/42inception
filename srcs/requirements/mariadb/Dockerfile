# Dockerfile for MariaDB
# ...

FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install mariadb-server  -y

EXPOSE 3306

COPY ./tools/conf_script.sh /usr/local/bin/

COPY ./tools/mariadb.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/conf_script.sh

RUN bash /usr/local/bin/conf_script.sh

RUN chmod +x /usr/local/bin/mariadb.sh

ENTRYPOINT [ "bash", "/usr/local/bin/mariadb.sh" ]