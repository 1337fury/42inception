#!/bin/sh

service vsftpd start

useradd $FTP_USER -d /home/$FTP_USER -M --password $FTP_PASS
mkdir -p /home/$FTP_USER/mysite
echo $FTP_USER > /etc/vsftpd.userlist
echo $FTP_USER > /etc/vsftpd.chroot_list
chown $FTP_USER:$FTP_USER -R /home/$FTP_USER
echo "$FTP_USER:$FTP_PASS" |  chpasswd

service vsftpd stop
/usr/sbin/vsftpd
