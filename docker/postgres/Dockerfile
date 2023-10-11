FROM postgres:16

ENV POSTGRES_USER cyberowl
ENV POSTGRES_PASSWORD secret
ENV PGDATA /data/postgres

COPY ./init.sql /docker-entrypoint-initdb.d/init.sql
