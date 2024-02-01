# Use the Debian Bullseye base image
FROM debian:bullseye

# Expose port 3306 for MariaDB, the default port for MariaDB.
EXPOSE 3306

# : Installs MariaDB and cleans up unnecessary files after installation.
RUN apt update && \
    apt install -y --no-install-recommends --no-install-suggests \
    mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# Copy custom MariaDB server configuration
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# Copy the script to the /bin/ directory
COPY tools/script.sh /bin/

# Make the script executable
RUN chmod +x /bin/script.sh

# Sets the cmd for the container to execute the specified script when the container starts.
CMD	["script.sh", "mysqld_safe"]