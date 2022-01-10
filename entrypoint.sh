#Set the defaultbackupdir (needs to be done here after the volume from docker-compose has been mapped)
#run db-init.sh script
#run sqlservr service so docker container does not stop
/opt/mssql/bin/mssql-conf set filelocation.defaultbackupdir /var/opt/mssql/backup &
sh ./db-init.sh &
chown -R mssql:mssql /var/opt/mssql/* /var/opt/mssql/.system/	
/opt/mssql/bin/sqlservr
