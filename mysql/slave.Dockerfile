FROM mariadb:10.3.11

COPY conf.d/slave/my-ext.cnf /etc/mysql/conf.d/
RUN chmod 644 /etc/mysql/conf.d/my-ext.cnf