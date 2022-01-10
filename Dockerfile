FROM mcr.microsoft.com/mssql/rhel/server:2019-latest
COPY . /
USER root
RUN groupadd -g 10001 mssql && \
    usermod -a -G mssql mssql
RUN chmod +x db-init.sh
USER mssql 
RUN /opt/mssql/bin/mssql-conf set sqlagent.enabled true
RUN /opt/mssql/bin/mssql-conf set hadr.hadrenabled  1
RUN /opt/mssql/bin/mssql-conf set memory.memorylimitmb 2048
RUN systemctl restart mssql-server.service
CMD /bin/bash ./entrypoint.sh
