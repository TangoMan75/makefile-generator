##############################################
### Symfony Doctrine
##############################################

## Create database and schema
db-create:
	@printf "${INFO}php -d memory-limit=-1 ${CONSOLE} doctrine:database:create${EOL}"
	@php -d memory-limit=-1 ${CONSOLE} doctrine:database:create
	@printf "${INFO}php -d memory-limit=-1 ${CONSOLE} doctrine:schema:create${EOL}"
	@php -d memory-limit=-1 ${CONSOLE} doctrine:schema:create

## Reset database
db-reset:
	@printf "${INFO}php -d memory-limit=-1 ${CONSOLE} doctrine:database:drop --force${EOL}"
	@php -d memory-limit=-1 ${CONSOLE} doctrine:database:drop --force
	@make --no-print-directory db-create

## Load fixtures
db-fixtures:
	@printf "${INFO}php ${CONSOLE} doctrine:fixtures:load -n${EOL}"
	@php ${CONSOLE} doctrine:fixtures:load -n

## Update schema
db-update:
	@printf "${INFO}php -d memory-limit=-1 ${CONSOLE} doctrine:schema:update${EOL}"
	@php -d memory-limit=-1 ${CONSOLE} doctrine:schema:update

