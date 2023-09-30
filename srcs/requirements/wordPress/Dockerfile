# Dockerfile for wordPress
#...
FROM debian:bookworm

	#PHP and its dependencies
RUN apt-get update -y && apt-get install -y \
	php8.2 \
	php-fpm \
	php-mysql \
	mariadb-client \
	wget \
	sendmail \
&& rm -rf /var/lib/apt/lists/*

	# Create /run/php directory
RUN mkdir -p /run/php

	#Download wordpress CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp
# Tset before keep
# ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp
# RUN chmod +x /usr/local/bin/wp

	#Copy the www.conf to the target location
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d

COPY ./tools/config_wp.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/config_wp.sh

#go www directory
WORKDIR /var/www/wordpress

EXPOSE 9000

	# Start PHP-FPM
CMD ["/usr/sbin/php-fpm8.2", "-F"]

ENTRYPOINT [ "sh", "/usr/local/bin/config_wp.sh" ]
