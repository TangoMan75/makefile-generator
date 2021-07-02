##############################################
### PHPUnit
##############################################

## Load fixtures
fixtures:
	@printf "${INFO}php ${CONSOLE} doctrine:fixtures:load --no-interaction --env=test${NL}"
	@php ${CONSOLE} doctrine:fixtures:load --no-interaction --env=test

## Run tests
tests: fixtures
	@if [ -x ./bin/phpunit ]; then \
		php -d memory-limit=-1 ./bin/phpunit --stop-on-failure; \
	elif [ -x ./vendor/bin/phpunit ]; then \
		bash ./vendor/bin/phpunit --stop-on-failure; \
	elif [ -x ./vendor/bin/simple-phpunit ]; then \
		php -d memory-limit=-1 ./vendor/bin/simple-phpunit --stop-on-failure; \
	else \
		printf "${DANGER}error: phpunit executable not found${NL}"; \
		exit 1; \
	fi

## Dump coverage (requires XDebug)
coverage:
	@if [ -x ./bin/phpunit ]; then \
		php -d memory-limit=-1 ./bin/phpunit --coverage-html ${PUBLIC}/coverage; \
	elif [ -x ./vendor/bin/phpunit ]; then \
		bash ./vendor/bin/phpunit --coverage-html ${PUBLIC}/coverage; \
	elif [ -x ./vendor/bin/simple-phpunit ]; then \
		php -d memory-limit=-1 ./vendor/bin/simple-phpunit --coverage-html ${PUBLIC}/coverage; \
	else \
		printf "${DANGER}error: phpunit executable not found${NL}"; \
		exit 1; \
	fi
ifeq (${SYSTEM}, Windows_NT)
	@printf "${INFO}start \"${PUBLIC}/coverage/index.html\"${NL}"
	@start "${PUBLIC}/coverage/index.html"
else
	@printf "${INFO}nohup xdg-open \"${PUBLIC}/coverage/index.html\" >/dev/null 2>&1${NL}"
	@nohup xdg-open "${PUBLIC}/coverage/index.html" >/dev/null 2>&1
endif

