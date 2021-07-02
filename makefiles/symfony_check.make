####################################
### Symfony Check
####################################

## Check correct environment installation
check:
	@printf "${INFO}whoami${NL}"
	@whoami
	@if [ -n "$(shell lsb_release -a 2>/dev/null)" ]; then \
		printf "${INFO}lsb_release -a${NL}"; \
		lsb_release -a; \
	fi
	@if [ -n "$(shell uname -a 2>/dev/null)" ]; then \
		printf "${INFO}uname -a${NL}"; \
		uname -a; \
	fi
	@if [ -n "$(shell docker --version 2>/dev/null)" ]; then \
		printf "${INFO}docker --version${NL}"; \
		docker --version; \
	else \
		printf "${WARNING}docker is not installed on your system${NL}"; \
	fi
	@if [ -n "$(shell docker-compose --version 2>/dev/null)" ]; then \
		printf "${INFO}docker-compose --version${NL}"; \
		docker-compose --version; \
	else \
		printf "${WARNING}docker-compose is not installed on your system${NL}"; \
	fi
	@if [ -n "$(shell psql --version 2>/dev/null)" ]; then \
		printf "${INFO}psql --version${NL}"; \
		psql --version; \
		printf "${INFO}service postgresql status${NL}"; \
		service postgresql status; \
	else \
		printf "${WARNING}PostgreSQL is not installed on your system${NL}"; \
	fi
	@if [ -n "$(shell mysql --version 2>/dev/null)" ]; then \
		printf "${INFO}mysql --version${NL}"; \
		mysql --version; \
	else \
		printf "${WARNING}MySQL is not installed on your system${NL}"; \
	fi
	@if [ -n "$(shell php --version 2>/dev/null)" ]; then \
		printf "${INFO}php --version${NL}"; \
		php --version; \
	else \
		printf "${WARNING}PHP is not installed on your system${NL}"; \
	fi
	@if [ -n "$(shell php-fpm --version 2>/dev/null)" ]; then \
		printf "${INFO}php-fpm --version${NL}"; \
		php-fpm --version; \
	else \
		printf "${WARNING}PHP-fpm is not installed on your system${NL}"; \
	fi
	@if [ -n "$(shell php --version 2>/dev/null)" ]; then \
		if [ -x "$(shell which composer 2>/dev/null)" ]; then \
			printf "${INFO}$(shell which composer) --version${NL}"; \
			$(shell which composer) --version; \
		else \
			printf "${WARNING}composer is not installed on your system${NL}"; \
		fi; \
	else \
		printf "${WARNING}unable to show composer version, php not installed${NL}"; \
	fi
	@if [ -n "$(shell php -m | grep curl 2>/dev/null)" ]; then \
		printf "${SUCCESS}php curl module is installed${NL}"; \
	else \
		printf "${DANGER}php curl module is missing${NL}"; \
	fi
	@if [ -n "$(shell php -m | grep gd 2>/dev/null)" ]; then \
		printf "${SUCCESS}php gd module is installed${NL}"; \
	else \
		printf "${DANGER}php gd module is missing${NL}"; \
	fi
	@if [ -n "$(shell php -m | grep intl 2>/dev/null)" ]; then \
		printf "${SUCCESS}php intl module is installed${NL}"; \
	else \
		printf "${DANGER}php intl module is missing${NL}"; \
	fi
	@if [ -n "$(shell php -m | grep mbstring 2>/dev/null)" ]; then \
		printf "${SUCCESS}php mbstring module is installed${NL}"; \
	else \
		printf "${DANGER}php mbstring module is missing${NL}"; \
	fi
	@if [ -n "$(shell php -m | grep mysql 2>/dev/null)" ]; then \
		printf "${SUCCESS}php mysql module is installed${NL}"; \
	else \
		printf "${WARNING}php mysql module is missing${NL}"; \
	fi
	@if [ -n "$(shell php -m | grep pgsql 2>/dev/null)" ]; then \
		printf "${SUCCESS}php pgsql module is installed${NL}"; \
	else \
		printf "${WARNING}php pgsql module is missing${NL}"; \
	fi
	@if [ -n "$(shell php -m | grep sqlite3 2>/dev/null)" ]; then \
		printf "${SUCCESS}php sqlite3 module is installed${NL}"; \
	else \
		printf "${WARNING}php sqlite3 module is missing${NL}"; \
	fi
	@if [ -n "$(shell php -m | grep xml 2>/dev/null)" ]; then \
		printf "${SUCCESS}php xml module is installed${NL}"; \
	else \
		printf "${DANGER}php xml module is missing${NL}"; \
	fi
