# #!/bin/bash

# # Define configuration variables
# WP_CONFIG_FILE="./wp-config.php"
# WORDPRESS_URL="http://wordpress.org/latest.tar.gz"

# # Check if wp-config.php exists
# if [ -f "$WP_CONFIG_FILE" ]; then
#     echo "WordPress is already configured."
# else
#     sleep 5
#     # Download and extract WordPress
#     wget "$WORDPRESS_URL" -O - | tar -xz -C .

#     # Rename and configure wp-config.php
#     mv wp-config-sample.php wp-config.php
#     sed -i "s/username_here/$SQL_USER/g" wp-config.php
#     sed -i "s/password_here/$SQL_PASSWORD/g" wp-config.php
#     sed -i "s/localhost/$DOMAIN_NAME/g" wp-config.php
#     sed -i "s/database_name_here/$SQL_DATABASE/g" wp-config.php
#     echo "WordPress has been configured."
# fi

# # Execute the provided command (e.g., start a web server)
# exec "$@"

####################################################################################################

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

	# #Inport env variables in the config file
	# sed -i "s/username_here/$SQL_USER/g" wp-config-sample.php
	# sed -i "s/password_here/$SQL_PASSWORD/g" wp-config-sample.php
	# sed -i "s/localhost/$DB_HOST/g" wp-config-sample.php
	# sed -i "s/database_name_here/$SQL_DATABASE/g" wp-config-sample.php
	# cp wp-config-sample.php wp-config.php
	 wp config create --allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=mariadb:3306 --path='/var/www/wordpress'

	wp core install --allow-root \
        --url=abdeel-o.42.fr \
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
	wp config set WP_REDIS_PORT 6739 --allow-root
	wp redis enable --allow-root

fi

exec "$@"