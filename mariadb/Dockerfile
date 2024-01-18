FROM alpine:3.18.5

RUN apk update && apk upgrade

RUN apk add mariadb mariadb-client

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

RUN mkdir /etc/mysql

COPY my.cnf /etc/mysql/my.cnf

RUN mkdir -p /var/run/mysqld/

RUN chown -R mysql:mysql /var/run/mysqld

EXPOSE 3306

CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql", "--socket=/var/run/mysqld/mysqld.sock", "--port=3306"]
