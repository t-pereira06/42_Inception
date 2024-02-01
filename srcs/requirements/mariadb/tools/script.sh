#!/bin/bash

service mariadb start 

mariadb -v -u root << EOF
CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;
CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';
GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';
GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO 'root'@'%' IDENTIFIED BY '$SQL_ROOT_PASSWORD';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$SQL_ROOT_PASSWORD');
EOF

service mariadb stop

sleep 5

exec $@