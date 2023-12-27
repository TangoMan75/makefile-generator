##############################################
### Requirements
##############################################

## Checking requirements automatically
requirements-checker:
# 	composer require symfony/requirements-checker
	@printf "${PRIMARY} open:${DEFAULT}${INFO} http://localhost:${port}/check.php ${PRIMARY}in your browser${EOL}"
ifeq (${SYSTEM}, Windows_NT)
	@printf "${INFO}start \"http://localhost:${port}/check.php\"${EOL}"
	-@start "http://localhost:${port}/check.php"
else
	@printf "${INFO}nohup xdg-open http://localhost:${port}/check.php >/dev/null 2>&1${EOL}"
	-@nohup xdg-open http://localhost:${port}/check.php >/dev/null 2>&1
endif
	@printf "${INFO}php -S localhost:${port} -t ./public${EOL}"
	@php -S localhost:${port} -t ./public

