##############################################
### Symfony Debug
##############################################

## Inspect autowiring
autowiring:
	@printf "${INFO}php -d memory-limit=-1 ${CONSOLE} debug:autowiring${NL}"
	@php -d memory-limit=-1 ${CONSOLE} debug:autowiring

## Inspect config
config:
	@printf "${INFO}php -d memory-limit=-1 ${CONSOLE} debug:config${NL}"
	@php -d memory-limit=-1 ${CONSOLE} debug:config

## Inspect container
container:
	@printf "${INFO}php -d memory-limit=-1 ${CONSOLE} debug:container${NL}"
	@php -d memory-limit=-1 ${CONSOLE} debug:container

## Inspect event-dispatcher
dispatcher:
	@printf "${INFO}php -d memory-limit=-1 ${CONSOLE} debug:event-dispatcher${NL}"
	@php -d memory-limit=-1 ${CONSOLE} debug:event-dispatcher

## Inspect router
router:
	@printf "${INFO}php -d memory-limit=-1 ${CONSOLE} debug:router${NL}"
	@php -d memory-limit=-1 ${CONSOLE} debug:router

## Inspect twig
twig:
	@printf "${INFO}php -d memory-limit=-1 ${CONSOLE} debug:twig${NL}"
	@php -d memory-limit=-1 ${CONSOLE} debug:twig

