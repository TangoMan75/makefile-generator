##################################################
### Check Python install
##################################################

## Check correct python environment installation
check-install:
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
	@if [ -n "$(shell virtualenv --version 2>/dev/null)" ]; then \
		printf "${INFO}virtualenv --version${EOL}"; \
		virtualenv --version; \
	else \
		printf "${WARNING}virtualenv is not installed on your system${EOL}"; \
	fi

