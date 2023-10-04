#!/bin/sh

service vsftpd start

useradd fury -d /home/fury && echo "fury:1234" | sudo chpasswd
mkdir -p /home/$FTP_USER/mysite
echo $FTP_USER > /etc/vsftpd.userlist
echo $FTP_USER > /etc/vsftpd.chroot_list
chown $FTP_USER:$FTP_USER -R /home/$FTP_USER

service vsftpd stop
/usr/sbin/vsftpd
