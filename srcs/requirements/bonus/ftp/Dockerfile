# Dockerfile for ftp
# ...
FROM debian:buster

RUN apt-get update -y && apt-get install -y \
	vsftpd \
&& rm -rf /var/lib/apt/lists/*

EXPOSE 21

COPY conf/vsftpd.conf /etc/vsftpd.conf

COPY tools/vsftpd.sh /usr/local/bin

RUN useradd fury -d /home/fury \
	&& echo "fury:1234" | sudo chpasswd

CMD [ "sh", "/usr/local/bin/vsftpd.sh" ]
