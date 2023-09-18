#!/bin/bash

service mysql start;

	# Create database named ${SQL_DATABASE}
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

	# Create user with password
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY \`${SQL_PASSWORD}\`;"

	#Grant all database privileges to sql user
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY \`${SQL_PASSWORD}\`;"

	# Change the password for the root user in MySQL
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

#
	# mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${SQL_ROOT_PASSWORD}'); FLUSH PRIVILEGES;"
#

	#Refresh all
mysql -e "FLUSH PRIVILEGES;"

	#Turning off MySQL
mysqladmin -u root -p $SQL_ROOT_PASSWORD shutdown

	#start the MySQL server in a safe mode 
exec mysqld_safe
