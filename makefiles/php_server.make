##############################################
### PHP Server
##############################################

## Run local server and open in browser
serve:
ifeq (${SYSTEM}, Windows_NT)
	@printf "${INFO}start \"http://localhost:${port}\"${NL}"
	-@start "http://localhost:${port}"
else
	@printf "${INFO}nohup xdg-open http://localhost:${port} >/dev/null 2>&1${NL}"
	-@nohup xdg-open http://localhost:${port} >/dev/null 2>&1
endif
	@printf "${INFO}php -d memory-limit=-1 -S localhost:${port} -t ${PUBLIC}${NL}"
	@php -d memory-limit=-1 -S localhost:${port} -t ${PUBLIC}

