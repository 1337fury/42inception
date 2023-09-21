#!/bin/bash
# Wait for MariaDB to launch (adjust the sleep time as needed)
sleep 10

cd /var/www/wordpress/
# Check if wp-config.php does not exist
if [ ! -f /var/www/wordpress/wp-config.php ]; then
    # Use the WordPress CLI to configure WordPress
    wp config create --allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=mariadb:3306 --path='/var/www/wordpress'

    # Run WordPress installation and create two users
    wp core install --allow-root \
        --url=https:localhost \
        --title="fury_website" \
        --admin_user=system \
        --admin_password=gn2E@J5gx44s \
        --admin_email=elouardyabdelhalim@gmail.com

    # Create a second user
    wp user create --allow-root \
        abdeel-o \
        abdelhalimeelouardi01@mail.com \
        --user_pass=hm!XM3X3S1F5

    echo "WordPress has been configured."
else
    echo "WordPress is already configured."
fi
cd
