FROM debian:bullseye

RUN apt-get update
RUN apt-get install wget -yq
RUN apt-get install vim -yq
RUN apt-get install curl -yq
RUN apt-get install sudo -yq
#Next lines of code have the purpose of installing the php repository, as it could't find php
RUN apt-get install ca-certificates apt-transport-https software-properties-common curl lsb-release -y
RUN curl -sSL https://packages.sury.org/php/README.txt | sudo bash -x
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install php8.2-cli php8.2-fpm php8.2-mysql -yq

# Fix the date to put it correctly
RUN ln -sf /usr/share/zoneinfo/Europe/Lisbon /etc/localtime

COPY tools/ tmp/

# Preparing the wordpress installation, downloading and putting the files
# in the right folders
RUN mkdir /var/www
RUN mkdir /var/www/html
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz
RUN rm latest.tar.gz
WORKDIR /var/www/html/wordpress
COPY /conf/ .
RUN chown -R www-data:www-data /var/www/html/wordpress

# Copy php file we have changed and put it in the folder
COPY /conf/www.conf /etc/php/fpm/pool.d/www.conf

# Install CLI wordpress, to be able to make changes on it
WORKDIR /tmp/
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp-cli

#Line for docker to run script when starting
ENTRYPOINT ["sh","-c", "/bin/bash /tmp/startwp.sh;"]