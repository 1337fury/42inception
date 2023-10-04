# Dockerfile for ftp
# ...
FROM debian:buster

RUN apt-get update -y && apt-get install -y \
	vsftpd \
&& rm -rf /var/lib/apt/lists/*

EXPOSE 21

COPY conf/vsftpd.conf /etc/vsftpd.conf

COPY tools/vsftpd.sh /usr/local/bin

RUN useradd ${FTP_USER}
	# && echo "${FTP_USER}:${FTP_PASS}" | chpasswd

CMD [ "sh", "/usr/local/bin/vsftpd.sh" ]
