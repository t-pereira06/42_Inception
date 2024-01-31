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


#HOW TO CHECK IF EVERYTHING IS OK SO FAR:
#1)build the image;
#2)docker run -d 48331fc16a65 (run the image)
#3)docker exec -it f35ffa4c266a(ID Container) bash
#4)check if env variables are ok:
#5)Run the MDB service: mysql -u theuser -p thedatabase
#6)if prompt is: MariaDB [thedatabase]> it means that all is ok.
#7)SHOW TABLES; #For now, we don't have any table, so it'll return an empty set, But at the end of the project, it'll have some tables created by wordpress.
#8) SHOW DATABASES;  command in MariaDB, and it has displayed a list of databases. In this case, you have two databases:
#DataBaseMDB
#information_schema
#The information_schema database is a system database that contains metadata about other databases on the MariaDB server.