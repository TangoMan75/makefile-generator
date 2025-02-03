##################################################
### Vue
##################################################

## Install and serve locally
up: yarn-install vue-cli-install install serve

## Install dependencies
install:
	@if [ ! -d node_modules ] && [ -f yarn.lock ]; then \
		printf "${INFO}yarn install${EOL}"; \
		yarn install; \
	elif [ ! -d node_modules ]; then \
		printf "${INFO}npm install${EOL}"; \
		npm install; \
	fi

## Serve with hot reload at localhost
serve:
	@printf "${INFO}nohup xdg-open http://localhost:${port} >/dev/null 2>&1${EOL}"
	@nohup xdg-open http://localhost:${port} >/dev/null 2>&1
	@if [ -f yarn.lock ]; then \
		printf "${INFO}yarn serve${EOL}"; \
		yarn serve; \
	else \
		printf "${INFO}npm run serve${EOL}"; \
		npm run serve; \
	fi

## Run unit tests
tests:
	@if [ -f yarn.lock ]; then \
		printf "${INFO}yarn run test:unit${EOL}"; \
		yarn run test:unit; \
	else \
		printf "${INFO}npm run test:unit${EOL}"; \
		npm run test:unit; \
	fi

## Lint and fix files
lint:
	@if [ -f yarn.lock ]; then \
		printf "${INFO}yarn run lint${EOL}"; \
		yarn run lint; \
	else \
		printf "${INFO}npm run lint${EOL}"; \
		npm run lint; \
	fi

## Build for production with minification
build:
	@printf "${INFO}rm -rf ./dist${EOL}"
	@rm -rf ./dist
	@if [ -f yarn.lock ]; then \
		printf "${INFO}yarn build${EOL}"; \
		yarn build; \
	else \
		printf "${INFO}npm run build${EOL}"; \
		npm run build; \
	fi

## Deploy to gh-pages
deploy: build
	( \
		printf "${INFO}cd dist${EOL}"; \
		cd dist; \
		printf "${INFO}git init${EOL}"; \
		git init; \
		printf "${INFO}git add -A${EOL}"; \
		git add -A; \
		printf "${INFO}git commit -m "$(shell date '+%Y-%m-%d %H:%M:%S')"${EOL}"; \
		git commit -m "$(shell date '+%Y-%m-%d %H:%M:%S')"; \
		printf "${INFO}git push -f git@{{ GIT_SERVER }}:{{ GIT_USER }}/{{ REPOSITORY }}.git main:gh-pages${EOL}"; \
		git push -f git@{{ GIT_SERVER }}:{{ GIT_USER }}/{{ REPOSITORY }}.git main:gh-pages; \
	)

## Uninstall app
uninstall:
	@printf "${INFO}sudo rm -rf node_modules${EOL}"
	@sudo rm -rf node_modules
	@printf "${INFO}sudo rm -rf dist${EOL}"
	@sudo rm -rf dist
