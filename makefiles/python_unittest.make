##################################################
### Python3 Unit Test
##################################################

## Run unit tests
tests:
	@printf "${INFO}python3 -m unittest -v tests/*.py${NL}"
	@python3 -m unittest -v tests/*.py

## Check static typing with mypy
lint:
	@# Check mypy module installed
	@python3 -c 'import mypy'
	@if [ $? == 0 ]; then \
		printf "${INFO}python3 -m mypy${NL}" && \
		python3 -m mypy; \
	else \
		printf "${INFO}mypy module not found${NL}"; \
	fi

