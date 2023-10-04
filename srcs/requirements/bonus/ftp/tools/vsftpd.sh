#!/bin/sh

$FTP_USER=fury
$FTP_PASS=1234

service vsftpd start

useradd $FTP_USER -d /home/$FTP_USER && echo "$FTP_USER:$FTP_PASS" | sudo chpasswd
# useradd fury -d /home/fury
mkdir -p /home/$FTP_USER/mysite
echo $FTP_USER > /etc/vsftpd.userlist
echo $FTP_USER > /etc/vsftpd.chroot_list
chown $FTP_USER:$FTP_USER -R /home/$FTP_USER

service vsftpd stop
/usr/sbin/vsftpd
