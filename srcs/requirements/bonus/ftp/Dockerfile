# Dockerfile for ftp
# ...
FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

RUN  apt-get install vsftpd -y

EXPOSE 21

COPY conf/vsftpd.conf /etc/vsftpd.conf

COPY tools/vsftpd.sh /usr/local/bin

CMD [ "sh", "/usr/local/bin/vsftpd.sh" ]
