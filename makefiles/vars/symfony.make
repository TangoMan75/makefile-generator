#--------------------------------------------------
# Symfony
#--------------------------------------------------

# get correct console executable
CONSOLE=$(shell if [ -f ./app/console ]; then echo './app/console'; elif [ -f ./bin/console ]; then echo './bin/console'; fi)
# get correct public folder
PUBLIC=$(shell if [ -d ./web ]; then echo './web'; elif [ -d ./public ]; then echo './public'; else echo './'; fi)
# get current php version
PHP_VERSION=$(shell php -v | grep -oP 'PHP\s\d+\.\d+' | sed s/'PHP '//)
# symfony version
SYMFONY_VERSION=$(shell if [ -f ./vendor/autoload.php ]; then ${CONSOLE} --version; else echo 'Symfony not installed'; fi)
# get current httpd user
HTTPDUSER=$(shell ps aux | grep -E 'apache|httpd|_www|www-data|nginx' | grep -v root | head -1 | cut -d\  -f1)
# app port
port?=8080
# app environment
env?=prod

