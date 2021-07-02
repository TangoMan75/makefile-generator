##################################################
### Traefik Let's Encrypt
##################################################

## Create acme.json file
acme:
	@printf "${INFO}touch ./config/acme.json${NL}"
	@touch ./config/acme.json

	@printf "${INFO}chmod 600 ./config/acme.json${NL}"
	@chmod 600 ./config/acme.json

