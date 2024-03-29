##################################################
### docker-compose extra
##################################################

## Show stack logs
dc-logs:
	@printf "${INFO}docker-compose logs -f --tail 5${EOL}"
	@docker-compose logs -f --tail 5

## Kill docker stack
dc-kill:
	@printf "${INFO}docker-compose kill${EOL}"
	@docker-compose kill

## Stop and remove containers, networks, volumes, and images
dc-clean:
	@printf "${INFO}docker-compose down --remove-orphans${EOL}"
	@docker-compose down --remove-orphans

## Check docker-compose.yaml syntax validity
dc-valid:
	@printf "${INFO}docker-compose config${EOL}"
	@docker-compose config

