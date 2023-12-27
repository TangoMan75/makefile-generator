####################################################
### Vagrant
####################################################

## Start vagrant
start:
	@bash ./bin/host/start_vagrant.sh

## Stop vagrant
stop:
	@printf "${INFO}vagrant halt${EOL}"
	@vagrant halt

## Open bash shell into guest
shell:
	@bash ./bin/host/start_vagrant.sh
	@printf "${INFO}vagrant ssh${EOL}"
	@vagrant ssh

## Restart vagrant
restart:
	@printf "${INFO}vagrant halt${EOL}"
	@vagrant halt
	@sleep 2
	@bash ./bin/host/start_vagrant.sh

## Validate Vagrantfile syntax
validate:
	@printf "${INFO}vagrant validate${EOL}"
	@vagrant validate

## List running vagrant boxes
status:
	@printf "${INFO}vagrant global-status${EOL}"
	@vagrant global-status

## Remove stale vagrant boxes
clean:
	@printf "${INFO}vagrant global-status --prune${EOL}"
	@vagrant global-status --prune

