##################################################
### Check install
##################################################

## Check correct environment installation
check:
	@if [ -n "$(shell ansible --version 2>/dev/null)" ]; then \
		printf "${INFO}ansible --version${EOL}"; \
		ansible --version; \
	else \
		printf "${WARNING}ansible is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell apache2 --version 2>/dev/null)" ]; then \
		printf "${INFO}apache2 --version${EOL}"; \
		apache2 --version; \
	else \
		printf "${WARNING}apache2 is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell aws --version 2>/dev/null)" ]; then \
		printf "${INFO}aws --version${EOL}"; \
		aws --version; \
	else \
		printf "${WARNING}aws is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell bundle --version 2>/dev/null)" ]; then \
		printf "${INFO}bundle --version${EOL}"; \
		bundle --version; \
	else \
		printf "${WARNING}bundle is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell chef --version 2>/dev/null)" ]; then \
		printf "${INFO}chef --version${EOL}"; \
		chef --version; \
	else \
		printf "${WARNING}chef is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell php --version 2>/dev/null)" ]; then \
		if [ -x "$(shell which composer 2>/dev/null)" ]; then \
			printf "${INFO}$(shell which composer) --version${EOL}"; \
			$(shell which composer) --version; \
		else \
			printf "${WARNING}composer is not installed on your system${EOL}"; \
		fi; \
	else \
		printf "${WARNING}unable to show composer version, php not installed${EOL}"; \
	fi
	@if [ -n "$(shell curl --version 2>/dev/null)" ]; then \
		printf "${INFO}curl --version$ | head -n1${EOL}"; \
		curl --version | head -n1; \
	else \
		printf "${WARNING}curl is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell docker --version 2>/dev/null)" ]; then \
		printf "${INFO}docker --version${EOL}"; \
		docker --version; \
	else \
		printf "${WARNING}docker is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell docker-compose --version 2>/dev/null)" ]; then \
		printf "${INFO}docker-compose --version${EOL}"; \
		docker-compose --version; \
	else \
		printf "${WARNING}docker-compose is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell gem --version 2>/dev/null)" ]; then \
		printf "${INFO}gem --version${EOL}"; \
		gem --version; \
	else \
		printf "${WARNING}gem is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell git --version 2>/dev/null)" ]; then \
		printf "${INFO}git --version${EOL}"; \
		git --version; \
	else \
		printf "${WARNING}git is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell ip -V 2>/dev/null)" ]; then \
		printf "${INFO}ip -V${EOL}"; \
		ip -V; \
	else \
		printf "${WARNING}ip is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell iptables --version 2>/dev/null)" ]; then \
		printf "${INFO}iptables --version${EOL}"; \
		iptables --version; \
	else \
		printf "${WARNING}iptables is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell mysql --version 2>/dev/null)" ]; then \
		printf "${INFO}mysql --version${EOL}"; \
		mysql --version; \
	else \
		printf "${WARNING}mysql is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell nginx --version 2>/dev/null)" ]; then \
		printf "${INFO}nginx --version${EOL}"; \
		nginx --version; \
	else \
		printf "${WARNING}nginx is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell nodejs --version 2>/dev/null)" ]; then \
		printf "${INFO}nodejs --version${EOL}"; \
		nodejs --version; \
	else \
		printf "${WARNING}nodejs is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell npm --version 2>/dev/null)" ]; then \
		printf "${INFO}npm --version${EOL}"; \
		npm --version; \
	else \
		printf "${WARNING}npm is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell openssl version 2>/dev/null)" ]; then \
		printf "${INFO}openssl version${EOL}"; \
		openssl version; \
	else \
		printf "${WARNING}openssl is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell php --version 2>/dev/null)" ]; then \
		printf "${INFO}php --version${EOL}"; \
		php --version; \
		printf "${INFO}php -m${EOL}"; \
		php -m; \
	else \
		printf "${WARNING}php is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell pip --version 2>/dev/null)" ]; then \
		printf "${INFO}pip --version${EOL}"; \
		pip --version; \
	else \
		printf "${WARNING}pip is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell pip3 --version 2>/dev/null)" ]; then \
		printf "${INFO}pip3 --version${EOL}"; \
		pip3 --version; \
	else \
		printf "${WARNING}pip3 is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell psql --version 2>/dev/null)" ]; then \
		printf "${INFO}psql --version${EOL}"; \
		psql --version; \
	else \
		printf "${WARNING}postgresql is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell python --version 2>/dev/null)" ]; then \
		printf "${INFO}python --version${EOL}"; \
		python --version; \
	else \
		printf "${WARNING}python is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell python2 --version 2>/dev/null)" ]; then \
		printf "${INFO}python2 --version${EOL}"; \
		python2 --version; \
	else \
		printf "${WARNING}python2 is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell python3 --version 2>/dev/null)" ]; then \
		printf "${INFO}python3 --version${EOL}"; \
		python3 --version; \
	else \
		printf "${WARNING}python3 is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell ruby --version 2>/dev/null)" ]; then \
		printf "${INFO}ruby --version${EOL}"; \
		ruby --version; \
	else \
		printf "${WARNING}ruby is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell rvm --version 2>/dev/null)" ]; then \
		printf "${INFO}rvm --version${EOL}"; \
		rvm --version; \
	else \
		printf "${WARNING}rvm is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell sqlite3 --version 2>/dev/null)" ]; then \
		printf "${INFO}sqlite3 --version${EOL}"; \
		sqlite3 --version; \
	else \
		printf "${WARNING}sqlite3 is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell ufw --version 2>/dev/null)" ]; then \
		printf "${INFO}ufw --version${EOL}"; \
		ufw --version; \
	else \
		printf "${WARNING}ufw is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell vagrant --version 2>/dev/null)" ]; then \
		printf "${INFO}vagrant --version${EOL}"; \
		vagrant --version; \
	else \
		printf "${WARNING}vagrant is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell vboxmanage --version 2>/dev/null)" ]; then \
		printf "${INFO}vboxmanage --version${EOL}"; \
		vboxmanage --version; \
	else \
		printf "${WARNING}vboxmanage is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell virtualenv --version 2>/dev/null)" ]; then \
		printf "${INFO}virtualenv --version${EOL}"; \
		virtualenv --version; \
	else \
		printf "${WARNING}virtualenv is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell wget --version 2>/dev/null)" ]; then \
		printf "${INFO}wget --version | head -n1${EOL}"; \
		wget --version | head -n1; \
	else \
		printf "${WARNING}wget is not installed on your system${EOL}"; \
	fi
	@if [ -n "$(shell which yarn 2>/dev/null)" ]; then \
		printf "${INFO}yarn --version${EOL}"; \
		yarn --version; \
	else \
		printf "${WARNING}yarn is not installed on your system${EOL}"; \
	fi

