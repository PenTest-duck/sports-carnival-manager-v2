FROM mysql:8.0.32

RUN chown -R mysql:root /var/lib/mysql/

ARG MYSQL_DB
ARG MYSQL_PW

ENV MYSQL_DATABASE=$MYSQL_DB
ENV MYSQL_ROOT_PASSWORD=$MYSQL_PW

ADD dbexport.sql /etc/mysql/db.sql

RUN cp /etc/mysql/db.sql /docker-entrypoint-initdb.d

EXPOSE 3306