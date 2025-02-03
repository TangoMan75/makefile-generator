##################################################
### Docker Compose Container
##################################################

## Build docker stack
dc-build:
	@printf "${INFO}docker-compose build${EOL}"
	@docker-compose build

## Start docker stack
dc-start:
	@printf "${INFO}docker-compose up --detach --remove-orphans${EOL}"
	@docker-compose up --detach --remove-orphans

## Stop docker stack
dc-stop:
	@printf "${INFO}docker-compose stop${EOL}"
	@docker-compose stop

## Stack status
dc-status:
	@printf "${INFO}docker-compose ps${EOL}"
	@docker-compose ps

## Restart container
dc-restart: dc-stop dc-build dc-start
