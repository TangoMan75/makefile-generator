##################################################
### Sass
##################################################

## Install standalone Sass globally
sass-install:
	@if [ -x "`command -v yarn`" ]; then \
		printf "${INFO}sudo yarn global add sass${NL}"; \
		sudo yarn global add sass; \
	elif [ -x "`command -v npm`" ]; then \
		printf "${INFO}sudo npm install -g sass${NL}"; \
		sudo npm install -g sass; \
	else \
		printf "${DANGER}error: yarn and npm missing, skipping...${NL}"; \
	fi;

