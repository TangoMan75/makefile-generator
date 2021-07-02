##################################################
### Symfony App
##################################################

## Install Symfony application locally
install: cp-install db-create

## Remove .env, *.lock, var/data.db, vendor, var/cache, var/log, var/sessions
uninstall:
	@printf "${INFO}sudo rm -f .env${NL}"
	@sudo rm -f .env
	@printf "${INFO}sudo rm -f ./composer.lock${NL}"
	@sudo rm -f ./composer.lock
	@printf "${INFO}sudo rm -f ./symfony.lock${NL}"
	@sudo rm -f ./symfony.lock
	@printf "${INFO}sudo rm -f ./var/data.db${NL}"
	@sudo rm -f ./var/data.db
	@printf "${INFO}sudo rm -f composer${NL}"
	@sudo rm -f composer
	@printf "${INFO}sudo rm -f installer${NL}"
	@sudo rm -f installer
	@printf "${INFO}sudo rm -f symfony${NL}"
	@sudo rm -f symfony
	@printf "${INFO}sudo rm -rf ./vendor${NL}"
	@sudo rm -rf ./vendor
	@make --no-print-directory cache

