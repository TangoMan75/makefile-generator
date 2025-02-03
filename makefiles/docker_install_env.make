##################################################
### Docker Install Local Env
##################################################

## Install docker locally
docker-install:
ifeq (${SYSTEM}, Linux)
	@printf "${INFO}sudo apt-get update${EOL}"
	-@sudo apt-get update
	@printf "${INFO}sudo apt-get install -y docker.io${EOL}"
	@sudo apt-get install -y docker.io
	@printf "${INFO}sudo usermod -a -G docker ${USER}${EOL}"
	@sudo usermod -a -G docker ${USER}
	@printf "${INFO}sudo su ${USER}${EOL}"
	@sudo su ${USER}
endif

## Remove docker
docker-remove:
ifeq (${SYSTEM}, Linux)
	@printf "${INFO}sudo apt-get remove -y docker.io${EOL}"
	@sudo apt-get remove -y docker.io
endif

