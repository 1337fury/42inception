#!/bin/bash

# Start the MySQL service
service mysql start

# Create database
mysql -e "CREATE DATABASE IF NOT EXISTS \`$SQL_DATABASE\`;"

# Create user with password
mysql -e "CREATE USER IF NOT EXISTS \`$SQL_USER\`@'%' IDENTIFIED BY '$SQL_PASSWORD';"

# Grant all database privileges to the SQL user
mysql -e "GRANT ALL PRIVILEGES ON \`$SQL_DATABASE\`.* TO \`$SQL_USER\`@'%' IDENTIFIED BY '$SQL_PASSWORD';"

# Change the password for the root user in MySQL
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"

# Flush privileges
mysql -u root -p$SQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

# Shutdown MySQL
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# Start the MySQL server in safe mode
exec mysqld_safe
