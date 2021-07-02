##############################################
### Python Server
##############################################

## Run server
serve:
	@printf "${INFO}python2 -m SimpleHTTPServer ${port}${NL}"
	@python2 -m SimpleHTTPServer ${port}
ifeq (${SYSTEM}, Windows_NT)
	@printf "${INFO}start \"http://localhost:${port}\"${NL}"
	-@start "http://localhost:${port}"
else
	@printf "${INFO}nohup xdg-open http://localhost:${port} >/dev/nul 2>&1${NL}"
	-@nohup xdg-open http://localhost:${port} >/dev/nul 2>&1
endif

