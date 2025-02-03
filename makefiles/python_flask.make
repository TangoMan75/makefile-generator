##################################################
### Python Flask
##################################################

## Deploy and start Flask app locally with one command
up: install serve

## Open default browser Serve app with gunicorn at localhost
serve:
ifeq (${SYSTEM}, Windows_NT)
	@printf "${INFO}start \"http://localhost:${port}\"${EOL}"
	-@start "http://localhost:${port}"
else
	@printf "${INFO}nohup xdg-open http://localhost:${port} >/dev/null 2>&1${EOL}"
	-@nohup xdg-open http://localhost:${port} >/dev/null 2>&1
endif
	@printf "${INFO}gunicorn --bind 0.0.0.0:${port} `basename ${filename} .py`:`basename ${filename} .py`${EOL}"
	@gunicorn --bind 0.0.0.0:${port} `basename ${filename} .py`:`basename ${filename} .py`

## Kill gunicorn server
stop:
	@printf "${INFO}pkill gunicorn${EOL}"
	-@pkill gunicorn

