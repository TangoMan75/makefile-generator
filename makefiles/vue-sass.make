##################################################
### Sass Vue local
##################################################

## Install Sass into project dependencies
sass-dev:
	@if [ -x "`command -v yarn`" ]; then \
		printf "${INFO}sudo yarn add --dev sass${NL}"; \
		sudo yarn add --dev sass; \
	elif [ -x "`command -v npm`" ]; then \
		printf "${INFO}sudo npm install --save-dev sass${NL}"; \
		sudo npm install --save-dev sass; \
	else \
		printf "${DANGER}error: yarn and npm missing, skipping...${NL}"; \
	fi;

