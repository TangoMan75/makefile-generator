####################################
### PostgreSQL
####################################

## Start database server as postgres user
psql-start:
	@printf "${INFO}/usr/lib/postgresql/11/bin/postgres -D /var/lib/postgresql/11/main -c config_file=/etc/postgresql/11/main/postgresql.conf${EOL}"
	@/usr/lib/postgresql/11/bin/postgres -D /var/lib/postgresql/11/main -c config_file=/etc/postgresql/11/main/postgresql.conf

## Stop database server
psql-stop:
	@printf "${INFO}service postgresql stop${EOL}"
	@service postgresql stop

