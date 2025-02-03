##################################################
### React Docker
##################################################

## Create network, build, start docker, yarn install and serve
up: network build start

## Open a terminal in the node container
shell:
	@printf "${INFO}docker-compose exec node sh${EOL}"
	@docker-compose exec node sh

## Open in default browser
open:
	@printf "${INFO}nohup xdg-open `docker inspect startups-admin --format 'http://{{.NetworkSettings.Networks.tango.IPAddress}}:3000' 2>/dev/null` >/dev/null 2>&1${EOL}"
	@nohup xdg-open `docker inspect startups-admin --format 'http://{{.NetworkSettings.Networks.tango.IPAddress}}:3000' 2>/dev/null` >/dev/null 2>&1
