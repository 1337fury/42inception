#!/bin/bash
# Wait for MariaDB to launch (adjust the sleep time as needed)
sleep 10

# Check if wp-config.php does not exist
if [ ! -f /var/www/wordpress/wp-config.php ]; then
    # Use the WordPress CLI to configure WordPress
    wp config create --allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=mariadb:3306 --path='/var/www/wordpress'

    echo "WordPress has been configured."
else
    echo "WordPress is already configured."
fi
