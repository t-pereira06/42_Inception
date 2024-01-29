# Starting php7.4-fpm creates /run/php/php7.1-fpm.sock
# Now the php-fpm7.4 -F -R works, before doing service php7.4-fpm it wouldn't work
service php7.4-fpm start
service php7.4-fpm stop
php-fpm7.4 -F -R