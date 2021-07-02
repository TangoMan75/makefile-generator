##################################################
### Symfony (Docker)
##################################################

## Build, start docker, composer install, create database, import data, and serve
up: network build start install import

## Open a terminal in the php container
shell:
	@printf "${INFO}docker-compose exec php sh${NL}"
	@docker-compose exec php sh

## Open in default browser
open:
	@printf "${INFO}nohup xdg-open `docker inspect $(shell basename ${CURDIR}) --format 'http://{{.NetworkSettings.Networks.tango.IPAddress}}/api/docs' 2>/dev/null` >/dev/null 2>&1${NL}"
	@nohup xdg-open `docker inspect $(shell basename ${CURDIR}) --format 'http://{{.NetworkSettings.Networks.tango.IPAddress}}/api/docs' 2>/dev/null` >/dev/null 2>&1

## Restart app and clear cache
restart: stop start cache

## Drop database, clear cache and re-import data
reset: database import cache

