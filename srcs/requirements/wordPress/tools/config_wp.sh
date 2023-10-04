#!/bin/sh

#check if wp-config.php exist
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
	sleep 5
	 wp config create --allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=mariadb:3306 --path='/var/www/wordpress'

	wp core install --allow-root \
        --url=$URL \
        --title=$TITLE \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASS \
        --admin_email=$WP_ADMIN_EMAIL

	wp user create --allow-root \
        $WP_SECOND_USER \
        $WP_SECOND_USER_MAIL \
        --user_pass=$WP_SECOND_USER_PASS
	
	# Bonus Part
	wp plugin install --allow-root redis-cache --activate
	wp config set WP_REDIS_HOST redis --allow-root
	wp config set WP_REDIS_PORT 6379 --allow-root
	wp redis enable --allow-root
fi

exec "$@"