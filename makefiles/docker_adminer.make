##################################################
### Docker Adminer
##################################################

## Connect to database with adminer
adminer: adminer-start adminer-info adminer-open

## Start adminer
adminer-start:
	@printf "${INFO}docker run --detach --name adminer --link ${container}:${container} -P adminer${NL}"
	@docker run --detach --name adminer --link ${container}:${container} -P adminer

## Open adminer in browser
adminer-open:
ifneq ($(shell docker inspect --format '{{ .NetworkSettings.IPAddress }}' ${container}),)
	@printf "${INFO}nohup xdg-open http://`docker inspect -f '{{ .NetworkSettings.IPAddress }}' adminer`:8080/?pgsql=`docker inspect -f '{{ .NetworkSettings.IPAddress }}' ${container}`\&username=root\&db=${container} >/dev/null 2>&1${NL}"
	-@nohup xdg-open http://`docker inspect -f '{{ .NetworkSettings.IPAddress }}' adminer`:8080/?pgsql=`docker inspect -f '{{ .NetworkSettings.IPAddress }}' ${container}`\&username=root\&db=${container} >/dev/null 2>&1
else
	@printf "${DANGER}error: image not ready${NL}"
endif

## Print adminer infos
adminer-info:
ifneq ($(shell docker inspect --format '{{ .NetworkSettings.IPAddress }}' ${container}),)
	@printf "${SUCCESS}server:    ${INFO}%s${NL}"             "`docker inspect -f '{{ .NetworkSettings.IPAddress }}' ${container}`"
	@printf "${SUCCESS}username:  ${INFO}%s${NL}"             "root"
	@printf "${SUCCESS}database:  ${INFO}%s${NL}"             ${container}
	@printf "${SUCCESS}password:  ${INFO}%s${NL}"             "toor"
	@printf "${SUCCESS}local url: ${INFO}http://%s:8080${NL}" "`docker inspect -f '{{ .NetworkSettings.IPAddress }}' adminer`"
else
	@printf "${SUCCESS}ip address: ${DANGER}error: image not ready${NL}"
	@printf "${SUCCESS}open ports: ${DANGER}error: image not ready${NL}"
endif

## Stop adminer
adminer-stop:
	@printf "${INFO}docker kill adminer${NL}"
	@docker kill adminer
	@printf "${INFO}docker rm adminer${NL}"
	@docker rm adminer

