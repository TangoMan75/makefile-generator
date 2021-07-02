##############################################
### PHPUnit (Docker)
##############################################

## Load fixtures
fixtures:
	@printf "${INFO}docker-compose exec php sh -c \"${CONSOLE} doctrine:fixtures:load --no-interaction --env=${env}\"${NL}"
	@docker-compose exec php sh -c "${CONSOLE} doctrine:fixtures:load --no-interaction --env=${env}"

## Load Alice fixtures
alice:
	@printf "${INFO}docker-compose exec php sh -c \"${CONSOLE} hautelook:fixtures:load --no-interaction --env=${env}\"${NL}"
	@docker-compose exec php sh -c "${CONSOLE} hautelook:fixtures:load --no-interaction --env=${env}"

## Run tests
tests:
## Run tests
tests:
ifeq ($(shell test ! -f ./var/test.db && echo true),true)
	@make --no-print-directory database env=test
	@make --no-print-directory own env=test
endif
	@make --no-print-directory fixtures env=test
ifeq ($(shell test -x ./vendor/bin/simple-phpunit && echo true),true)
	$(eval PHP_UNIT="./vendor/bin/simple-phpunit")
else ifeq ($(shell test -x ./bin/phpunit && echo true),true)
	$(eval PHP_UNIT="./bin/phpunit")
else
	@printf "${DANGER}error: phpunit executable not found${NL}"
	exit 1
endif
	@printf "${INFO}docker-compose exec php sh -c \"php -d memory-limit=-1 ${PHP_UNIT} tests/Unit --stop-on-failure\"${NL}"
	@docker-compose exec php sh -c "php -d memory-limit=-1 ${PHP_UNIT} tests/Unit --stop-on-failure"
	@printf "${INFO}docker-compose exec php sh -c \"php -d memory-limit=-1 ${PHP_UNIT} tests/Functional --stop-on-failure\"${NL}"
	@docker-compose exec php sh -c "php -d memory-limit=-1 ${PHP_UNIT} tests/Functional --stop-on-failure"

## Dump coverage (requires XDebug)
coverage:
	@if [ -x ./bin/phpunit ]; then \
		printf "${INFO}docker-compose exec php sh -c \"php -d memory-limit=-1 ./bin/phpunit --coverage-html ${PUBLIC}/coverage\"${NL}"; \
		docker-compose exec php sh -c "php -d memory-limit=-1 ./bin/phpunit --coverage-html ${PUBLIC}/coverage"; \
	elif [ -x ./vendor/bin/phpunit ]; then \
		printf "${INFO}docker-compose exec php sh -c \"bash ./vendor/bin/phpunit --coverage-html ${PUBLIC}/coverage\"${NL}"; \
		docker-compose exec php sh -c "bash ./vendor/bin/phpunit --coverage-html ${PUBLIC}/coverage"; \
	elif [ -x ./vendor/bin/simple-phpunit ]; then \
		printf "${INFO}docker-compose exec php sh -c \"php -d memory-limit=-1 ./vendor/bin/simple-phpunit --coverage-html ${PUBLIC}/coverage\"${NL}"; \
		docker-compose exec php sh -c "php -d memory-limit=-1 ./vendor/bin/simple-phpunit --coverage-html ${PUBLIC}/coverage"; \
	else \
		printf "${DANGER}error: phpunit executable not found${NL}"; \
		exit 1; \
	fi
	@printf "${INFO}docker-compose exec php sh -c \"php -d memory-limit=-1 ${PHP_UNIT} --coverage-html ${PUBLIC}/coverage\"${NL}"
	@docker-compose exec php sh -c "php -d memory-limit=-1 ${PHP_UNIT} --coverage-html ${PUBLIC}/coverage"

ifeq (${SYSTEM}, Windows_NT)
	@printf "${INFO}start \"${PUBLIC}/coverage/index.html\"${NL}"
	@start "${PUBLIC}/coverage/index.html"
else
	@printf "${INFO}nohup xdg-open \"${PUBLIC}/coverage/index.html\" >/dev/null 2>&1${NL}"
	@nohup xdg-open "${PUBLIC}/coverage/index.html" >/dev/null 2>&1
endif

