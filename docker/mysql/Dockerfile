FROM mysql:8.1

ENV MYSQL_ROOT_PASSWORD secret
ENV MYSQL_USER cyberowl
ENV MYSQL_PASSWORD secret

COPY ./my.cnf /etc/mysql/conf.d/my.cnf

COPY ./init.sql /docker-entrypoint-initdb.d/init.sql
