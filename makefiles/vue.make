##################################################
### Vue
##################################################

## Install and serve locally
up: yarn-install vue-cli-install install serve

## Install dependencies
install:
	@if [ ! -d node_modules ] && [ -f yarn.lock ]; then \
		printf "${INFO}yarn install${NL}"; \
		yarn install; \
	elif [ ! -d node_modules ]; then \
		printf "${INFO}npm install${NL}"; \
		npm install; \
	fi

## Serve with hot reload at localhost
serve:
	@printf "${INFO}nohup xdg-open http://localhost:${port} >/dev/null 2>&1${NL}"
	@nohup xdg-open http://localhost:${port} >/dev/null 2>&1
	@if [ -f yarn.lock ]; then \
		printf "${INFO}yarn serve${NL}"; \
		yarn serve; \
	else \
		printf "${INFO}npm run serve${NL}"; \
		npm run serve; \
	fi

## Run unit tests
tests:
	@if [ -f yarn.lock ]; then \
		printf "${INFO}yarn run test:unit${NL}"; \
		yarn run test:unit; \
	else \
		printf "${INFO}npm run test:unit${NL}"; \
		npm run test:unit; \
	fi

## Lint and fix files
lint:
	@if [ -f yarn.lock ]; then \
		printf "${INFO}yarn run lint${NL}"; \
		yarn run lint; \
	else \
		printf "${INFO}npm run lint${NL}"; \
		npm run lint; \
	fi

## Build for production with minification
build:
	@printf "${INFO}rm -rf ./dist${NL}"
	@rm -rf ./dist
	@if [ -f yarn.lock ]; then \
		printf "${INFO}yarn build${NL}"; \
		yarn build; \
	else \
		printf "${INFO}npm run build${NL}"; \
		npm run build; \
	fi

## Deploy to gh-pages
deploy: build
	( \
		printf "${INFO}cd dist${NL}"; \
		cd dist; \
		printf "${INFO}git init${NL}"; \
		git init; \
		printf "${INFO}git add -A${NL}"; \
		git add -A; \
		printf "${INFO}git commit -m "$(shell date '+%Y-%m-%d %H:%M:%S')"${NL}"; \
		git commit -m "$(shell date '+%Y-%m-%d %H:%M:%S')"; \
		printf "${INFO}git push -f git@{{ GIT_SERVER }}:{{ GIT_USER }}/{{ REPOSITORY }}.git master:gh-pages${NL}"; \
		git push -f git@{{ GIT_SERVER }}:{{ GIT_USER }}/{{ REPOSITORY }}.git master:gh-pages; \
	)

## Uninstall app
uninstall:
	@printf "${INFO}sudo rm -rf node_modules${NL}"
	@sudo rm -rf node_modules
	@printf "${INFO}sudo rm -rf dist${NL}"
	@sudo rm -rf dist
