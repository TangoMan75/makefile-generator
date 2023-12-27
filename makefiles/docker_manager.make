##################################################
### Docker Manager
##################################################

## List images, volumes and network information
top:
	@printf "${INFO}docker ps --all${EOL}"
	@docker ps --all
	@printf "${INFO}docker images --all${EOL}"
	@docker images --all
	@printf "${INFO}docker volume ls${EOL}"
	@docker volume ls
	@printf "${INFO}docker network ls${EOL}"
	@docker network ls
	@printf "${INFO}docker inspect --format '{{ .Name }}: {{ .NetworkSettings.IPAddress }}' `docker ps --quiet | tr '\n' ' '` 2>/dev/null${EOL}"
	@docker inspect --format '{{ .Name }}: {{ .NetworkSettings.IPAddress }}' `docker ps --quiet | tr '\n' ' '` 2>/dev/null

## Stop all running containers
stop-all:
	@printf "${INFO}docker stop `docker ps --quiet`${EOL}"
	@docker stop `docker ps --quiet`

## Kill all running containers
kill-all:
	@printf "${INFO}docker kill `docker ps --quiet | tr '\n' ' '` 2>/dev/null${EOL}"
	@docker kill `docker ps --quiet | tr '\n' ' '` 2>/dev/null
	@printf "${INFO}docker rm `docker ps --all --quiet | tr '\n' ' '` 2>/dev/null${EOL}"
	@docker rm `docker ps --all --quiet | tr '\n' ' '` 2>/dev/null

## Remove all unused system, images, containers, volumes and networks
clean:
	@printf "${INFO}docker system prune --force${EOL}"
	@docker system prune --force
	@printf "${INFO}docker image prune --all --force${EOL}"
	@docker image prune --all --force
	@printf "${INFO}docker container prune --force${EOL}"
	@docker container prune --force
	@printf "${INFO}docker volume prune --force${EOL}"
	@docker volume prune --force
	@printf "${INFO}docker network prune --force${EOL}"
	@docker network prune --force

## Kill and remove all system, images, containers, volumes and networks
remove-all:
	-@make --no-print-directory -s kill-all
	-@make --no-print-directory -s clean

