#!/bin/bash

service vsftpd start

useradd $FTP_USER -d /home/$FTP_USER -M --password $FTP_PASS
echo $FTP_USER >> /etc/vsftpd.user_list
chown $FTP_USER:$FTP_USER -R /home/$FTP_USER

service vsftpd stop
/usr/sbin/vsftpd
