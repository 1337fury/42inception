#!/bin/sh

#check if wp-config.php exist
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
	sleep 5
	#Download wordpress and all config file
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz wordpress

	 wp config create --allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=mariadb:3306 --path='/var/www/wordpress'

	wp core install --allow-root \
        --url=10.11.249.226 \
        --title="fury_website" \
        --admin_user=system \
        --admin_password=gn2E@J5gx44s \
        --admin_email=sys@admin.me

	wp user create --allow-root \
        abdeel-o \
        fury@std.me \
        --user_pass='hm!XM3X3S1F5'
	
	# Bonus Part
	wp plugin install --allow-root redis-cache --activate
	wp config set WP_REDIS_HOST redis --allow-root
	wp config set WP_REDIS_PORT 6379 --allow-root
	wp redis enable --allow-root

fi

exec "@"