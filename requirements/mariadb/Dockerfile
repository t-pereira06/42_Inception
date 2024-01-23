FROM debian:bullseye

# Set environment variables for MariaDB
ENV MYSQL_ROOT_PASSWORD="42porto"
ENV MYSQL_DATABASE="database"
ENV MYSQL_USER="tsodre-p"
ENV MYSQL_PASSWORD="42porto"

# Install MariaDB server
RUN apt-get update
RUN apt-get install -y --no-install-recommends --no-install-suggests mariadb-server
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/script.sh /bin/

RUN chmod +x /bin/script.sh

ENTRYPOINT ["sh", "/bin/script.sh"]
