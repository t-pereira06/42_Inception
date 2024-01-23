# Config php.ini
sed -i "s/memory_limit = .*/memory_limit = 256M/" /etc/php/8.2/fpm/php.ini
sed -i "s/upload_max_filesize = .*/upload_max_filesize = 128M/" /etc/php/8.2/fpm/php.ini
sed -i "s/zlib.output_compression = .*/zlib.output_compression = on/" /etc/php/8.2/fpm/php.ini
sed -i "s/max_execution_time = .*/max_execution_time = 18000/" /etc/php/8.2/fpm/php.ini

# Starting php8.2-fpm creates /run/php/php7.1-fpm.sock
# Now the php-fpm8.2 -F -R works, before doing service php8.2-fpm it wouldn't work
service php8.2-fpm start
service php8.2-fpm stop
php-fpm8.2 -F -R  