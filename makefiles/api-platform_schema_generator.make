##############################################
### Schema Generator
##############################################

## Install Schema Generator binary
sg-install:
	@printf "${INFO}composer require --dev api-platform/schema-generator${NL}"
	@composer require --dev api-platform/schema-generator
	@if [ ! -f "./config/schema.yaml" ]; then \
		printf "${INFO}touch ./config/schema.yaml${NL}"; \
		touch ./config/schema.yaml; \
	fi;

## Generate schema from ./config/schema.yaml
sg-generate:
	@printf "${INFO}php -d memory-limit=-1 vendor/bin/schema generate-types ./src/ ./config/schema.yaml${NL}"
	@php -d memory-limit=-1 vendor/bin/schema generate-types ./src/ ./config/schema.yaml

