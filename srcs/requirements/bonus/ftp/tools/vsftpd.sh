#!/bin/sh

service vsftpd start

mkdir -p /home/$FTP_USER/mysite
echo $FTP_USER > /etc/vsftpd.userlist
echo $FTP_USER > /etc/vsftpd.chroot_list
chown $FTP_USER:$FTP_USER -R /home/$FTP_USER

service vsftpd stop
/usr/sbin/vsftpd
