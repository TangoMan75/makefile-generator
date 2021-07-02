##################################################
### Docker Compose Container
##################################################

## Build docker stack
dc-build:
	@printf "${INFO}docker-compose build${NL}"
	@docker-compose build

## Start docker stack
dc-start:
	@printf "${INFO}docker-compose up --detach --remove-orphans${NL}"
	@docker-compose up --detach --remove-orphans

## Stop docker stack
dc-stop:
	@printf "${INFO}docker-compose stop${NL}"
	@docker-compose stop

## Stack status
dc-status:
	@printf "${INFO}docker-compose ps${NL}"
	@docker-compose ps

## Restart container
dc-restart: dc-stop dc-build dc-start
