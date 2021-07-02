##############################################
### Symfony Doctrine
##############################################

## Create database and schema
db-create:
	@printf "${INFO}php -d memory-limit=-1 ${CONSOLE} doctrine:database:create${NL}"
	@php -d memory-limit=-1 ${CONSOLE} doctrine:database:create
	@printf "${INFO}php -d memory-limit=-1 ${CONSOLE} doctrine:schema:create${NL}"
	@php -d memory-limit=-1 ${CONSOLE} doctrine:schema:create

## Reset database
db-reset:
	@printf "${INFO}php -d memory-limit=-1 ${CONSOLE} doctrine:database:drop --force${NL}"
	@php -d memory-limit=-1 ${CONSOLE} doctrine:database:drop --force
	@make --no-print-directory db-create

## Load fixtures
db-fixtures:
	@printf "${INFO}php ${CONSOLE} doctrine:fixtures:load -n${NL}"
	@php ${CONSOLE} doctrine:fixtures:load -n

## Update schema
db-update:
	@printf "${INFO}php -d memory-limit=-1 ${CONSOLE} doctrine:schema:update${NL}"
	@php -d memory-limit=-1 ${CONSOLE} doctrine:schema:update

