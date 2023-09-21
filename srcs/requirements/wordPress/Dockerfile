# Dockerfile for wordPress
#...
FROM debian:buster

RUN apt update -y && apt upgrade -y

	#To install wordPress from its download link we need `wget` command
RUN apt install wget -y

	#PHP and its dependencies
RUN apt install -y \
php7.3 \
php-fpm \
php-mysql \
mariadb-client

	#Copy the www.conf to the target location
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

	#Download wordPress files
RUN wget https://wordpress.org/latest.tar.gz -P /var/www/

	#Decompress
RUN cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz

	#change the owner and the group to the root user
RUN chown -R root:root /var/www/wordpress

	#Download wordpress CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

	#Give it the permissions
RUN chmod +x wp-cli.phar

	#Move it to the right location to be available to all users
RUN mv wp-cli.phar /usr/local/bin/wp

	# Create a directory for WordPress configuration scripts
RUN mkdir -p /WordPressconf

	# Copy the config_wp.sh script to the container
COPY tools/config_wp.sh /WordPressconf/config_wp.sh

RUN chmod +x /WordPressconf/config_wp.sh

	# Create /run/php directory
RUN mkdir -p /run/php

EXPOSE 9000

	# Start PHP-FPM
CMD ["/usr/sbin/php-fpm7.3", "-F"]

ENTRYPOINT ["/WordPressconf/config_wp.sh"]
