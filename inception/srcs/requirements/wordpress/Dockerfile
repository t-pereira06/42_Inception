FROM debian:bullseye

RUN apt-get update
RUN apt-get install wget -yq
RUN apt-get install vim -yq
RUN apt-get install curl -yq
RUN apt-get install sudo -yq

#Next lines of code have the purpose of installing the php repository
#RUN apt-get install ca-certificates apt-transport-https software-properties-common curl lsb-release -y
#RUN curl -sSL https://packages.sury.org/php/README.txt | sudo bash -x
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -yq --no-install-recommends php7.4-fpm php7.4-mysql 


# Download and extract WordPress
RUN wget https://wordpress.org/wordpress-6.3.1.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.3.1.tar.gz && rm wordpress-6.3.1.tar.gz

# Copy the WordPress configuration file
COPY ./conf/wp-config.php /var/www/wordpress/

# Set ownership of the WordPress directory
RUN chown -R root:root /var/www/wordpress

# Configure PHP to work with WordPress
COPY	./conf/www.conf /etc/php/7.4/fpm/pool.d/
RUN	mkdir -p /run/php

# Download and install WordPress Command Line Interface
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Copy the WordPress setup script
COPY	./tools/startwp.sh /bin/
RUN	chmod +x /bin/startwp.sh

ENTRYPOINT	["sh", "/bin/startwp.sh"]