##################################################
### Python Virtualenv Flask
##################################################

## Deploy and start your Flask app in fresh virtualenv with one command
venv-up: venv-create
	@printf "${INFO}sleep 1${EOL}"
	@sleep 1
	-@make --no-print-directory venv-serve

## Serve app with gunicorn from virtualenv
venv-serve:
ifeq ($(shell test -f ${virtualenv}/bin/gunicorn && echo true),true)
	@printf "${INFO}app listening here: http://localhost:${port}${EOL}"
	@printf "${INFO}${virtualenv}/bin/gunicorn --bind 0.0.0.0:${port} `basename ${filename} .py`:`basename ${filename} .py`${EOL}"
	@${virtualenv}/bin/gunicorn --bind 0.0.0.0:${port} `basename ${filename} .py`:`basename ${filename} .py`
else
	@printf "${DANGER}error: virtualenv not found${EOL}"
	@exit 1
endif

## Kill gunicorn server and remove virtualenv
venv-kill: stop venv-remove

