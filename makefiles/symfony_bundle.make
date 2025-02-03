##################################################
### Symfony Bundle
##################################################

## Run tests
tests:
	@if [ ! -d ./vendor ]; then \
		make --no-print-directory cp-install; \
	fi
	@if [ -x ./bin/phpunit ]; then \
		php -d memory-limit=-1 ./bin/phpunit --stop-on-failure; \
	elif [ -x ./vendor/bin/phpunit ]; then \
		bash ./vendor/bin/phpunit --stop-on-failure; \
	elif [ -x ./vendor/bin/simple-phpunit ]; then \
		php -d memory-limit=-1 ./vendor/bin/simple-phpunit --stop-on-failure; \
	else \
		printf 'error: phpunit executable not found\n'; \
		exit 1; \
	fi

## Dump coverage (requires XDebug)
coverage:
	@if [ ! -d ./vendor ]; then \
		make --no-print-directory cp-install; \
	fi
	@if [ -x ./bin/phpunit ]; then \
		php -d memory-limit=-1 ./bin/phpunit --coverage-html ${PUBLIC}/coverage; \
	elif [ -x ./vendor/bin/phpunit ]; then \
		bash ./vendor/bin/phpunit --coverage-html ${PUBLIC}/coverage; \
	elif [ -x ./vendor/bin/simple-phpunit ]; then \
		php -d memory-limit=-1 ./vendor/bin/simple-phpunit --coverage-html ${PUBLIC}/coverage; \
	else \
		printf 'error: phpunit executable not found\n'; \
		exit 1; \
	fi
ifeq (${SYSTEM}, Windows_NT)
	start "${PUBLIC}/coverage/index.html"
else
	nohup xdg-open "${PUBLIC}/coverage/index.html" >/dev/null 2>&1
endif

