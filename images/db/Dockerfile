FROM mysql:latest

ENV MYSQL_ALLOW_EMPTY_PASSWORD yes
ENV MYSQL_DATABASE main

# create tables when container starts for the first time
COPY schema.sql /docker-entrypoint-initdb.d

# make the user able to run db queries without explicitly entering credentials
RUN touch ~/.my.cnf \
    && echo "[client]" >> ~/.my.cnf \
    && echo "user=root" >> ~/.my.cnf \
    && echo "password=$MYSQL_ROOT_PASSWORD" >> ~/.my.cnf

# create a script for dumping the db
RUN touch ~/db-dump.sh \
    && echo "#!/bin/bash" >> ~/db-dump.sh \
    && echo "mysqldump $MYSQL_DATABASE | tee /var/mysql-dump" >> ~/db-dump.sh \
    && chmod +x ~/db-dump.sh
