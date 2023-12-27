##############################################
### Python Server
##############################################

## Run server
serve:
	@printf "${INFO}python2 -m SimpleHTTPServer ${port}${EOL}"
	@python2 -m SimpleHTTPServer ${port}
ifeq (${SYSTEM}, Windows_NT)
	@printf "${INFO}start \"http://localhost:${port}\"${EOL}"
	-@start "http://localhost:${port}"
else
	@printf "${INFO}nohup xdg-open http://localhost:${port} >/dev/nul 2>&1${EOL}"
	-@nohup xdg-open http://localhost:${port} >/dev/nul 2>&1
endif

