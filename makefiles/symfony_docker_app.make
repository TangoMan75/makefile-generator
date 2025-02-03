##################################################
### Symfony App (Docker)
##################################################

## Install Symfony application in docker
install:
	@make --no-print-directory composer
	@make --no-print-directory database
ifeq ($(env),dev)
	@printf "${INFO}make --no-print-directory own${EOL}"
	@make --no-print-directory own
endif

## Uninstall app completely
uninstall: stop
	@printf "${INFO}sudo rm -f ./.env.local${EOL}"
	@sudo rm -f ./.env.local

	@printf "${INFO}sudo rm -f ./composer.lock${EOL}"
	@sudo rm -f ./composer.lock

	@printf "${INFO}sudo rm -f ./symfony.lock${EOL}"
	@sudo rm -f ./symfony.lock

	@printf "${INFO}sudo rm -f ./var/data.db${EOL}"
	@sudo rm -f ./var/data.db

	@printf "${INFO}sudo rm -f ./var/dev.db${EOL}"
	@sudo rm -f ./var/dev.db

	@printf "${INFO}sudo rm -f ./var/test.db${EOL}"
	@sudo rm -f ./var/test.db

	@printf "${INFO}sudo rm -rf ./public/bundles${EOL}"
	@sudo rm -rf ./public/bundles

	@printf "${INFO}sudo rm -rf ./bin/.phpunit${EOL}"
	@sudo rm -rf ./bin/.phpunit

	@printf "${INFO}sudo rm -rf ./vendor${EOL}"
	@sudo rm -rf ./vendor
	@make --no-print-directory nuke

## Composer install Symfony project
composer:
ifeq ($(env),dev)
	@printf "${INFO}cp .env.dev .env.local${EOL}"
	@cp .env.dev .env.local

	@printf "${INFO}cp .env.dev .env.dev.local${EOL}"
	@cp .env.dev .env.dev.local

	@printf "${INFO}cp .env.dev .env.prod.local${EOL}"
	@cp .env.dev .env.prod.local
endif
	@printf "${INFO}docker-compose exec php sh -c \"composer install --no-interaction --optimize-autoloader --prefer-dist --working-dir=/www\"${EOL}"
	@docker-compose exec php sh -c "composer install --no-interaction --optimize-autoloader --prefer-dist --working-dir=/www"

## Create database and schema
database:
	@printf "${INFO}docker-compose exec php sh -c \"${CONSOLE} doctrine:database:drop --force --env=${env}\"${EOL}"
	@docker-compose exec php sh -c "${CONSOLE} doctrine:database:drop --force --env=${env}"

	@printf "${INFO}docker-compose exec php sh -c \"${CONSOLE} doctrine:database:create --env=${env}\"${EOL}"
	@docker-compose exec php sh -c "${CONSOLE} doctrine:database:create --env=${env}"

	@printf "${INFO}docker-compose exec php sh -c \"${CONSOLE} doctrine:schema:create --dump-sql --env=${env}\"${EOL}"
	@docker-compose exec php sh -c "${CONSOLE} doctrine:schema:create --dump-sql --env=${env}"

	@printf "${INFO}docker-compose exec php sh -c \"${CONSOLE} doctrine:schema:create --env=${env}\"${EOL}"
	@docker-compose exec php sh -c "${CONSOLE} doctrine:schema:create --env=${env}"

