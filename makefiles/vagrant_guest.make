####################################################
### Vagrant Guest
####################################################

## Start and ssh into vagrant guest
up:
	@bash ./bin/host/start_vagrant.sh
	@printf "${INFO}vagrant ssh${EOL}"
	@vagrant ssh

## Create vagrant guest
init: config
	-@bash ./bin/host/create_vagrant_guest.sh

## Init configuration
config:
	@bash ./bin/host/init_vagrant_config.sh
	@bash ./bin/host/set_hosts.sh

## Set hosts
hosts:
	@bash ./bin/host/set_hosts.sh

## Rebuild vagrant guest forcing provisioners
reset: destroy
	@sleep 2
	@printf "${INFO}vagrant up --provision --destroy-on-error${EOL}"
	@vagrant up --provision --destroy-on-error

## Update guest provisioners
update:
	@printf "${INFO}vagrant halt${EOL}"
	@vagrant halt
	@sleep 2
	@bash ./bin/host/set_hosts.sh
	@printf "${INFO}vagrant up --provision --destroy-on-error${EOL}"
	@vagrant up --provision --destroy-on-error

## Destroy guest
destroy:
	@bash ./bin/host/destroy_vagrant.sh
	@bash ./bin/host/restart_nfs.sh

