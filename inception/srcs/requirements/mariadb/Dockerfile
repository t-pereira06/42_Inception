FROM debian:bullseye

# Install MariaDB server
RUN apt-get update
RUN apt-get install --no-install-recommends --no-install-suggests mariadb-server -yq
RUN rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/startdb.sh /bin/

RUN chmod +x /bin/startdb.sh

CMD	["startdb.sh", "mysqld_safe"]
