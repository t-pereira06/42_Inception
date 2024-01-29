# Start the MariaDB service
service mariadb start -p$MYSQL_ROOT_PASSWORD

# Create a database if it does not already exist
mariadb -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

# Create a user if it does not already exist, identified by the specified password
mariadb -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# Grant all privileges on the specified database to the specified user, allowing access from any host
mariadb -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# Change the password for the 'root' user on the local machine
mariadb -uroot -p$MYSQL_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; FLUSH PRIVILEGES;"

# Shut down MariaDB, waiting for all slaves to catch up
mariadb-admin -p$MYSQL_ROOT_PASSWORD -uroot -p $MYSQL_ROOT_PASSWORD --wait-for-all-slaves shutdown

# Start the MariaDB server in a safe mode
mysqld_safe