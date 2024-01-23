# Starting php8.2-fpm creates /run/php/php7.1-fpm.sock
# Now the php-fpm8.2 -F -R works, before doing service php8.2-fpm it wouldn't work
service php8.2-fpm start
service php8.2-fpm stop
php-fpm8.2 -F -R