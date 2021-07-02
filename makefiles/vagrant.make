####################################################
### Vagrant
####################################################

## Start vagrant
start:
	@bash ./bin/host/start_vagrant.sh

## Stop vagrant
stop:
	@printf "${INFO}vagrant halt${NL}"
	@vagrant halt

## Open bash shell into guest
shell:
	@bash ./bin/host/start_vagrant.sh
	@printf "${INFO}vagrant ssh${NL}"
	@vagrant ssh

## Restart vagrant
restart:
	@printf "${INFO}vagrant halt${NL}"
	@vagrant halt
	@sleep 2
	@bash ./bin/host/start_vagrant.sh

## Validate Vagrantfile syntax
validate:
	@printf "${INFO}vagrant validate${NL}"
	@vagrant validate

## List running vagrant boxes
status:
	@printf "${INFO}vagrant global-status${NL}"
	@vagrant global-status

## Remove stale vagrant boxes
clean:
	@printf "${INFO}vagrant global-status --prune${NL}"
	@vagrant global-status --prune

