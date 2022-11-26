FROM mariadb:10.3.11

COPY conf.d/master/my-ext.cnf /etc/mysql/conf.d/
RUN chmod 644 /etc/mysql/conf.d/my-ext.cnf