#--------------------------------------------------
# Help
#--------------------------------------------------

## Print this help
help:
	@printf "\033[1;41m TangoMan $(shell basename ${CURDIR}) \033[0\n"

	@printf "\033[1;44m Description\033[0\n"
	@printf "\033[33m {{ DESCRIPTION }}\033[0\n"

	@printf "\033[1;44m Commands\033[0\n"
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' ${MAKEFILE_LIST} | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

