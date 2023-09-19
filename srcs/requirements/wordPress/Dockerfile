# Dockerfile for wordPress

FROM debain:buster

RUN apt update -y && apt upgrade -y

	#To install wordPress from its download link we need `wget` command
RUN apt install wget -y

	#PHP and its dependencies
RUN apt install -y \
php8.2 \
php-fpm \
php-mysql \
mariadb-client

	#Download wordPress files
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www/

	#Decompress
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

	#change the owner and the group to the root user
RUN chown -R root:root /var/www/wordpress


