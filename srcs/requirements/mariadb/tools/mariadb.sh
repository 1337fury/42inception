#!/bin/sh
service mariadb start

# Wait for MySQL to start
while ! mysqladmin ping -h localhost --silent; do
    sleep 1
done

# CREATE USER #
echo "CREATE USER '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" | mysql

# PRIVILGES FOR ROOT AND USER FOR ALL IP ADRESS #
echo "GRANT ALL PRIVILEGES ON *.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$SQL_ROOT_PASSWORD';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

# CREAT WORDPRESS DATABASE #
echo "CREATE DATABASE $SQL_DATABASE;" | mysql


kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
