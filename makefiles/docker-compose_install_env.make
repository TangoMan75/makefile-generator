##################################################
### Docker Compose Install Local Env
##################################################

## Install docker-compose locally
dc-install:
ifeq (${SYSTEM}, Linux)
	@#curl -L => follow redirects
	@printf "${INFO}sudo curl -L \"https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m`\" -o /usr/bin/docker-compose${NL}"
	@sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m`" -o /usr/bin/docker-compose
	@printf "${INFO}sudo chmod +x /usr/bin/docker-compose${NL}"
	@sudo chmod +x /usr/bin/docker-compose
endif

