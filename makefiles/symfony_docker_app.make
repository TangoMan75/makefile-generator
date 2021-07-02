##################################################
### Symfony App (Docker)
##################################################

## Install Symfony application in docker
install:
	@make --no-print-directory composer
	@make --no-print-directory database
ifeq ($(env),dev)
	@printf "${INFO}make --no-print-directory own${NL}"
	@make --no-print-directory own
endif

## Uninstall app completely
uninstall: stop
	@printf "${INFO}sudo rm -f ./.env.local${NL}"
	@sudo rm -f ./.env.local

	@printf "${INFO}sudo rm -f ./composer.lock${NL}"
	@sudo rm -f ./composer.lock

	@printf "${INFO}sudo rm -f ./symfony.lock${NL}"
	@sudo rm -f ./symfony.lock

	@printf "${INFO}sudo rm -f ./var/data.db${NL}"
	@sudo rm -f ./var/data.db

	@printf "${INFO}sudo rm -f ./var/dev.db${NL}"
	@sudo rm -f ./var/dev.db

	@printf "${INFO}sudo rm -f ./var/test.db${NL}"
	@sudo rm -f ./var/test.db

	@printf "${INFO}sudo rm -rf ./public/bundles${NL}"
	@sudo rm -rf ./public/bundles

	@printf "${INFO}sudo rm -rf ./bin/.phpunit${NL}"
	@sudo rm -rf ./bin/.phpunit

	@printf "${INFO}sudo rm -rf ./vendor${NL}"
	@sudo rm -rf ./vendor
	@make --no-print-directory nuke

## Composer install Symfony project
composer:
ifeq ($(env),dev)
	@printf "${INFO}cp .env.dev .env.local${NL}"
	@cp .env.dev .env.local

	@printf "${INFO}cp .env.dev .env.dev.local${NL}"
	@cp .env.dev .env.dev.local

	@printf "${INFO}cp .env.dev .env.prod.local${NL}"
	@cp .env.dev .env.prod.local
endif
	@printf "${INFO}docker-compose exec php sh -c \"composer install --no-interaction --optimize-autoloader --prefer-dist --working-dir=/www\"${NL}"
	@docker-compose exec php sh -c "composer install --no-interaction --optimize-autoloader --prefer-dist --working-dir=/www"

## Create database and schema
database:
	@printf "${INFO}docker-compose exec php sh -c \"${CONSOLE} doctrine:database:drop --force --env=${env}\"${NL}"
	@docker-compose exec php sh -c "${CONSOLE} doctrine:database:drop --force --env=${env}"

	@printf "${INFO}docker-compose exec php sh -c \"${CONSOLE} doctrine:database:create --env=${env}\"${NL}"
	@docker-compose exec php sh -c "${CONSOLE} doctrine:database:create --env=${env}"

	@printf "${INFO}docker-compose exec php sh -c \"${CONSOLE} doctrine:schema:create --dump-sql --env=${env}\"${NL}"
	@docker-compose exec php sh -c "${CONSOLE} doctrine:schema:create --dump-sql --env=${env}"

	@printf "${INFO}docker-compose exec php sh -c \"${CONSOLE} doctrine:schema:create --env=${env}\"${NL}"
	@docker-compose exec php sh -c "${CONSOLE} doctrine:schema:create --env=${env}"

