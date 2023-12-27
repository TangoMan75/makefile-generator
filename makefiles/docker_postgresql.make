####################################
### Docker PostgreSQL
####################################

## Start database server from host
docker-psql-start:
	@printf "${INFO}docker exec -u 0 ${container} service postgresql start${EOL}"
	@docker exec -u 0 ${container} service postgresql start

## Stop database server from host
docker-psql-stop:
	@printf "${INFO}docker exec -u 0 ${container} service postgresql stop${EOL}"
	@docker exec -u 0 ${container} service postgresql stop

