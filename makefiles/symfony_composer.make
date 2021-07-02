##############################################
### Composer
##############################################

## Composer install project
cp-install:
ifeq (${SYSTEM}, Windows_NT)
	@printf "${INFO}composer install${NL}"
	@composer install
else
	@printf "${INFO}php -d memory-limit=-1 $(shell which composer) install${NL}"
	@php -d memory-limit=-1 $(shell which composer) install
endif

## Composer update project
cp-update:
ifeq (${SYSTEM}, Windows_NT)
	@printf "${INFO}composer update${NL}"
	@composer update
else
	@printf "${INFO}php -d memory-limit=-1 $(shell which composer) update${NL}"
	@php -d memory-limit=-1 $(shell which composer) update
endif

