##################################################
### Symfony App
##################################################

## Install Symfony application locally
install: cp-install db-create

## Remove .env, *.lock, var/data.db, vendor, var/cache, var/log, var/sessions
uninstall:
	@printf "${INFO}sudo rm -f .env${EOL}"
	@sudo rm -f .env
	@printf "${INFO}sudo rm -f ./composer.lock${EOL}"
	@sudo rm -f ./composer.lock
	@printf "${INFO}sudo rm -f ./symfony.lock${EOL}"
	@sudo rm -f ./symfony.lock
	@printf "${INFO}sudo rm -f ./var/data.db${EOL}"
	@sudo rm -f ./var/data.db
	@printf "${INFO}sudo rm -f composer${EOL}"
	@sudo rm -f composer
	@printf "${INFO}sudo rm -f installer${EOL}"
	@sudo rm -f installer
	@printf "${INFO}sudo rm -f symfony${EOL}"
	@sudo rm -f symfony
	@printf "${INFO}sudo rm -rf ./vendor${EOL}"
	@sudo rm -rf ./vendor
	@make --no-print-directory cache

