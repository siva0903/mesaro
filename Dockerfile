FROM mcr.microsoft.com/mssql/rhel/server:2019-latest
COPY . /
COPY mssql.conf /var/opt/mssql/mssql.conf
USER root
RUN groupadd -g 10001 mssql && \
    usermod -a -G mssql mssql
RUN chmod +x db-init.sh
USER mssql 
CMD /bin/bash ./entrypoint.sh
