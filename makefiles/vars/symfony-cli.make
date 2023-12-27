#--------------------------------------------------
# Symfony CLI
#--------------------------------------------------

# get correct console executable
CONSOLE=$(shell if [ -f ./app/console ]; then echo './app/console'; elif [ -f ./bin/console ]; then echo './bin/console'; fi)
# get correct public folder
PUBLIC=$(shell if [ -d ./web ]; then echo './web'; elif [ -d ./public ]; then echo './public'; else echo './'; fi)
# get current php version
PHP_VERSION=$(shell php -v | grep -oP 'PHP\s\d+\.\d+' | sed s/'PHP '//)
# symfony version
VERSION=$(shell ${CONSOLE} --version)

