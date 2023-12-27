##################################################
### Docker Container (deprecated)
##################################################

## Build container
build:
ifeq ($(shell test -f ./${image} && echo true),true)
	@printf "${INFO}docker build . -f ${image} -t ${container}${EOL}"
	@docker build . -f ${image} -t ${container}
else
	@printf "${WARNING}Dockerfile not found, skipping${EOL}"
endif

## Start container and bind host CWD with given guest path
start:
ifeq (${workdir},)
	@printf "${INFO}docker run --detach --name ${container} --network ${network} --rm -P ${container}${EOL}"
	@docker run --detach --name ${container} --network ${network} --rm -P ${container}
else
	@printf "${INFO}docker run --volume \"$(PWD)\":${workdir} --detach --name ${container} --network ${network} --rm -P ${container}${EOL}"
	@docker run --volume "$(PWD)":${workdir} --detach --name ${container} --network ${network} --rm -P ${container}
endif

## Open in default browser
open:
ifeq ($(shell docker inspect -f '{{ .NetworkSettings.IPAddress }}' ${container} 2>/dev/null),)
	@printf "${INFO}nohup xdg-open http://localhost${app_route} >/dev/null 2>&1${EOL}"
	@nohup xdg-open http://localhost${app_route} >/dev/null 2>&1
else
	@printf "${INFO}nohup xdg-open http://`docker inspect -f '{{ .NetworkSettings.IPAddress }}' ${container}`${app_route} >/dev/null 2>&1${EOL}"
	@nohup xdg-open http://`docker inspect -f '{{ .NetworkSettings.IPAddress }}' ${container}`${app_route} >/dev/null 2>&1
endif

## Open shell as root into running container
shell:
	@printf "${INFO}docker exec -u 0 -it ${container} /bin/bash${EOL}"
	@docker exec -u 0 -it ${container} /bin/bash

## Print image status
status:
	@printf "${SUCCESS}image:      ${INFO}%s${EOL}"        "`docker inspect --format '{{ .Config.Image }}' ${container} 2>/dev/null`"
	@printf "${SUCCESS}hostname:   ${INFO}%s${EOL}"        "`docker inspect --format '{{ .Config.Hostname }}' ${container} 2>/dev/null`"
ifneq ($(shell docker inspect --format '{{ .NetworkSettings.IPAddress }}' ${container} 2>/dev/null),)
	@printf "${SUCCESS}ip address: ${INFO}%s${EOL}"        "`docker inspect --format '{{ .NetworkSettings.IPAddress }}' ${container} 2>/dev/null`"
	@printf "${SUCCESS}open ports: ${INFO}%s${EOL}"        "`docker port ${container} 2>/dev/null`"
	@printf "${SUCCESS}local url:  ${INFO}http://%s${EOL}" "`docker inspect --format '{{ .NetworkSettings.IPAddress }}' ${container} 2>/dev/null`"
else
	@if [ ${network} != 'host' ]; then \
		printf "${SUCCESS}ip address: ${DANGER}error${EOL}"; \
		printf "${SUCCESS}open ports: ${DANGER}error${EOL}"; \
	else \
		printf "${SUCCESS}ip address: ${INFO}127.0.0.1${EOL}"; \
		printf "${SUCCESS}local url:  ${INFO}http://localhost${EOL}"; \
	fi
endif

## Stop container
stop:
	@printf "${INFO}docker stop ${container}${EOL}"
	@docker stop ${container}

## Kill container
kill:
	@printf "${INFO}docker kill ${container}${EOL}"
	@docker kill ${container}
	@printf "${INFO}docker rm ${container} 2>/dev/null${EOL}"
	@docker rm ${container} 2>/dev/null

## Stop and remove image
remove:
	-@make --no-print-directory kill
	@printf "${INFO}docker image rm ${container}${EOL}"
	@docker image rm ${container}

## Start container with given command binding host CWD with given guest path
cmd:
ifeq (${workdir},)
	@printf "${INFO}docker run --detach --name ${container} --network ${network} --rm -P ${container} ${command}${EOL}"
	@docker run --detach --name ${container} --network ${network} --rm -P ${container} ${command}
else
	@printf "${INFO}docker run --volume \"$(PWD)\":${workdir} --detach --name ${container} --network ${network} --rm -P ${container} ${command}${EOL}"
	@docker run --volume "$(PWD)":${workdir} --detach --name ${container} --network ${network} --rm -P ${container} ${command}
endif

## Print container volumes
volumes:
ifeq ($(shell test -x `which python 2>/dev/null` && echo true),true)
	@printf "${INFO}docker inspect --format='{{ json .Mounts }}' ${container} ${EOL}"
	@docker inspect --format='{{ json .Mounts }}' ${container} 2>/dev/null | python -m json.tool
else
	@printf "${INFO}docker inspect --format='{{ json .Mounts }}' ${container} ${EOL}"
	@docker inspect --format='{{ json .Mounts }}' ${container} 2>/dev/null
endif

## Print container logs
logs:
	@printf "${INFO}docker logs ${container} --tail 5${EOL}"
	@docker logs ${container} --tail 5

