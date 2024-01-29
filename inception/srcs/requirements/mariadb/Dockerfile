FROM debian:bullseye

# Install MariaDB server
RUN apt-get update
RUN apt-get install mariadb-server -yq
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/startdb.sh /bin/

RUN chmod +x /bin/startdb.sh

ENTRYPOINT ["sh", "/bin/startdb.sh"]
