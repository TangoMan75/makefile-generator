##############################################
### Composer
##############################################

## Composer install project
cp-install:
ifeq (${SYSTEM}, Windows_NT)
	@printf "${INFO}composer install${EOL}"
	@composer install
else
	@printf "${INFO}php -d memory-limit=-1 $(shell which composer) install${EOL}"
	@php -d memory-limit=-1 $(shell which composer) install
endif

## Composer update project
cp-update:
ifeq (${SYSTEM}, Windows_NT)
	@printf "${INFO}composer update${EOL}"
	@composer update
else
	@printf "${INFO}php -d memory-limit=-1 $(shell which composer) update${EOL}"
	@php -d memory-limit=-1 $(shell which composer) update
endif

