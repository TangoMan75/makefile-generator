##################################################
### Yarn Install Local Env
##################################################

## Install yarn
yarn-install:
ifeq (${SYSTEM}, Linux)
	@if [ -z "$(shell yarn --version 2>/dev/null)" ]; then \
		printf "${INFO}curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -${EOL}"; \
		curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -; \
		printf "${INFO}echo 'deb https://dl.yarnpkg.com/debian/ stable main' | sudo tee /etc/apt/sources.list.d/yarn.list${EOL}"; \
		echo 'deb https://dl.yarnpkg.com/debian/ stable main' | sudo tee /etc/apt/sources.list.d/yarn.list; \
		printf "${INFO}sudo apt-get update${EOL}"; \
		sudo apt-get update; \
		printf "${INFO}sudo apt-get install -y yarn${EOL}"; \
		sudo apt-get install -y yarn; \
	else \
		printf "${WARNING}yarn already installed, skipping...${EOL}"; \
	fi
endif

## Install vue-cli
vue-cli-install:
ifeq (${SYSTEM}, Linux)
	@if [ -z "$(shell vue --version 2>/dev/null)" ]; then \
		printf "${INFO}sudo yarn global add @vue/cli${EOL}"; \
		sudo yarn global add @vue/cli; \
	else \
		printf "${WARNING}vue-cli already installed, skipping...${EOL}"; \
	fi
endif

