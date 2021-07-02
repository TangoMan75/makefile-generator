##################################################
### Docker Manager
##################################################

## List images, volumes and network information
top:
	@printf "${INFO}docker ps --all${NL}"
	@docker ps --all
	@printf "${INFO}docker images --all${NL}"
	@docker images --all
	@printf "${INFO}docker volume ls${NL}"
	@docker volume ls
	@printf "${INFO}docker network ls${NL}"
	@docker network ls
	@printf "${INFO}docker inspect --format '{{ .Name }}: {{ .NetworkSettings.IPAddress }}' `docker ps --quiet | tr '\n' ' '` 2>/dev/null${NL}"
	@docker inspect --format '{{ .Name }}: {{ .NetworkSettings.IPAddress }}' `docker ps --quiet | tr '\n' ' '` 2>/dev/null

## Stop all running containers
stop-all:
	@printf "${INFO}docker stop `docker ps --quiet`${NL}"
	@docker stop `docker ps --quiet`

## Kill all running containers
kill-all:
	@printf "${INFO}docker kill `docker ps --quiet | tr '\n' ' '` 2>/dev/null${NL}"
	@docker kill `docker ps --quiet | tr '\n' ' '` 2>/dev/null
	@printf "${INFO}docker rm `docker ps --all --quiet | tr '\n' ' '` 2>/dev/null${NL}"
	@docker rm `docker ps --all --quiet | tr '\n' ' '` 2>/dev/null

## Remove all unused system, images, containers, volumes and networks
clean:
	@printf "${INFO}docker system prune --force${NL}"
	@docker system prune --force
	@printf "${INFO}docker image prune --all --force${NL}"
	@docker image prune --all --force
	@printf "${INFO}docker container prune --force${NL}"
	@docker container prune --force
	@printf "${INFO}docker volume prune --force${NL}"
	@docker volume prune --force
	@printf "${INFO}docker network prune --force${NL}"
	@docker network prune --force

## Kill and remove all system, images, containers, volumes and networks
remove-all:
	-@make --no-print-directory -s kill-all
	-@make --no-print-directory -s clean

