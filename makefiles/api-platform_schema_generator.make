##############################################
### Schema Generator
##############################################

## Install Schema Generator binary
sg-install:
	@printf "${INFO}composer require --dev api-platform/schema-generator${EOL}"
	@composer require --dev api-platform/schema-generator
	@if [ ! -f "./config/schema.yaml" ]; then \
		printf "${INFO}touch ./config/schema.yaml${EOL}"; \
		touch ./config/schema.yaml; \
	fi;

## Generate schema from ./config/schema.yaml
sg-generate:
	@printf "${INFO}php -d memory-limit=-1 vendor/bin/schema generate-types ./src/ ./config/schema.yaml${EOL}"
	@php -d memory-limit=-1 vendor/bin/schema generate-types ./src/ ./config/schema.yaml

