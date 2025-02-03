##################################################
### Traefik Let's Encrypt
##################################################

## Create acme.json file
acme:
	@printf "${INFO}touch ./config/acme.json${EOL}"
	@touch ./config/acme.json

	@printf "${INFO}chmod 600 ./config/acme.json${EOL}"
	@chmod 600 ./config/acme.json

