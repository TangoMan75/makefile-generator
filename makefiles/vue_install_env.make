##################################################
### Yarn Install Local Env
##################################################

## Install yarn
yarn-install:
ifeq (${SYSTEM}, Linux)
	@if [ -z "$(shell yarn --version 2>/dev/null)" ]; then \
		printf "${INFO}curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -${NL}"; \
		curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -; \
		printf "${INFO}echo 'deb https://dl.yarnpkg.com/debian/ stable main' | sudo tee /etc/apt/sources.list.d/yarn.list${NL}"; \
		echo 'deb https://dl.yarnpkg.com/debian/ stable main' | sudo tee /etc/apt/sources.list.d/yarn.list; \
		printf "${INFO}sudo apt-get update${NL}"; \
		sudo apt-get update; \
		printf "${INFO}sudo apt-get install -y yarn${NL}"; \
		sudo apt-get install -y yarn; \
	else \
		printf "${WARNING}yarn already installed, skipping...${NL}"; \
	fi
endif

## Install vue-cli
vue-cli-install:
ifeq (${SYSTEM}, Linux)
	@if [ -z "$(shell vue --version 2>/dev/null)" ]; then \
		printf "${INFO}sudo yarn global add @vue/cli${NL}"; \
		sudo yarn global add @vue/cli; \
	else \
		printf "${WARNING}vue-cli already installed, skipping...${NL}"; \
	fi
endif

