##################################################
### Git
##################################################

## Initialise git submodules
submodules:
	@if [ -f ./.gitmodules ]; then \
		printf "${INFO}git submodule update --init --recursive${EOL}"; \
		git submodule update --init --recursive; \
	fi

