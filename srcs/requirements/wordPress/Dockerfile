# Dockerfile for wordPress
#...
FROM debian:bookworm

RUN apt update -y && apt upgrade -y

	#PHP and its dependencies
RUN apt install -y \
php8.2 \
php-fpm \
php-mysql \
mariadb-client

	#To install wordPress from its download link we need `wget` command
RUN apt install wget -y

	#Copy the www.conf to the target location
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d

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

	# Copy the config_wp.sh script to the container
COPY ./tools/config_wp.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/config_wp.sh

	# Create /run/php directory
RUN mkdir -p /run/php

EXPOSE 9000

	# Start PHP-FPM
CMD ["/usr/sbin/php-fpm8.2", "-F"]

ENTRYPOINT ["bash", "/usr/local/bin/config_wp.sh"]
