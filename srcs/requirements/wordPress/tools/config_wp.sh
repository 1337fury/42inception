# #!/bin/bash
# # Wait for MariaDB to launch (adjust the sleep time as needed)
# sleep 5

# # Check if wp-config.php does not exist
# if [ ! -f /var/www/wordpress/wp-config.php ]; then
# 	cd /var/www/wordpress/
#     # Use the WordPress CLI to configure WordPress
#     wp config create --allow-root \
#         --dbname=$SQL_DATABASE \
#         --dbuser=$SQL_USER \
#         --dbpass=$SQL_PASSWORD \
#         --dbhost=mariadb:3306 --path='/var/www/wordpress'

#     # Run WordPress installation and create two users
#     wp core install --allow-root \
#         --url=abdeel-o.42.fr \
#         --title="fury_website" \
#         --admin_user=system \
#         --admin_password=gn2E@J5gx44s \
#         --admin_email=elouardyabdelhalim@gmail.com

#     # Create a second user
#     wp user create --allow-root \
#         abdeel-o \
#         abdelhalimeelouardi01@mail.com \
#         --user_pass='hm!XM3X3S1F5'

# 	cd
#     echo "WordPress has been configured."
# else
#     echo "WordPress is already configured."
# fi


#!/bin/sh

#check if wp-config.php exist
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else


	#Download wordpress and all config file
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	#Inport env variables in the config file
	sed -i "s/username_here/$SQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$SQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$DOMAIN_NAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$SQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php

fi

exec "$@"