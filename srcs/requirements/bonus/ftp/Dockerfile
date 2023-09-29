# Dockerfile for ftp
# ...
FROM debian:bookworm

RUN apt-get update -y && apt-get upgrade -y

RUN  apt-get install vsftpd -y

COPY conf/vsftpd.conf /etc/vsftpd.conf

COPY tools/vsftpd.sh /usr/local/bin

CMD [ "bash", "/usr/local/bin/vsftpd.sh" ]
