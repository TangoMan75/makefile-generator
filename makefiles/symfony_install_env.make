##############################################
### Symfony Install Local Env
##############################################

## Download and install composer
install-composer:
	@printf "${PRIMARY}download composer-installer${NL}"
	@printf "${INFO}wget -q -O composer.phar https://getcomposer.org/composer-stable.phar${NL}"
	@wget -q -O composer.phar https://getcomposer.org/composer-stable.phar
	@printf "${PRIMARY}install composer globally${NL}"
	@printf "${INFO}sudo mv composer.phar /usr/local/bin/composer${NL}"
	@sudo mv composer.phar /usr/local/bin/composer
	@printf "${PRIMARY}fix permissions${NL}"
	@printf "${INFO}sudo chmod +x /usr/local/bin/composer${NL}"
	@sudo chmod +x /usr/local/bin/composer
	@printf "${INFO}composer self-update --stable${NL}"
	@composer self-update --stable

## Install latest php locally
install-php:
ifeq (${SYSTEM}, Linux)
	@printf "${INFO}sudo apt-get install -y --no-install-recommends php${PHP_VERSION}${NL}"
	@sudo apt-get install -y --no-install-recommends php${PHP_VERSION}
	@printf "${INFO}sudo apt-get install -y --no-install-recommends php${PHP_VERSION}-fpm${NL}"
	@sudo apt-get install -y --no-install-recommends php${PHP_VERSION}-fpm
	@printf "${INFO}sudo apt-get install -y --no-install-recommends php${PHP_VERSION}-gd${NL}"
	@sudo apt-get install -y --no-install-recommends php${PHP_VERSION}-gd
	@printf "${INFO}sudo apt-get install -y --no-install-recommends php${PHP_VERSION}-curl${NL}"
	@sudo apt-get install -y --no-install-recommends php${PHP_VERSION}-curl
	@printf "${INFO}sudo apt-get install -y --no-install-recommends php${PHP_VERSION}-xml${NL}"
	@sudo apt-get install -y --no-install-recommends php${PHP_VERSION}-xml
	@printf "${INFO}sudo apt-get install -y --no-install-recommends php${PHP_VERSION}-intl${NL}"
	@sudo apt-get install -y --no-install-recommends php${PHP_VERSION}-intl
	@printf "${INFO}sudo apt-get install -y --no-install-recommends php${PHP_VERSION}-mysql${NL}"
	@sudo apt-get install -y --no-install-recommends php${PHP_VERSION}-mysql
	@printf "${INFO}sudo apt-get install -y --no-install-recommends php${PHP_VERSION}-pgsql${NL}"
	@sudo apt-get install -y --no-install-recommends php${PHP_VERSION}-pgsql
	@printf "${INFO}sudo apt-get install -y --no-install-recommends php${PHP_VERSION}-sqlite3${NL}"
	@sudo apt-get install -y --no-install-recommends php${PHP_VERSION}-sqlite3
	@printf "${INFO}sudo apt-get install -y --no-install-recommends php${PHP_VERSION}-mbstring${NL}"
	@sudo apt-get install -y --no-install-recommends php${PHP_VERSION}-mbstring
endif

## PHP settings for development environment
php-dev-settings:
ifeq (${SYSTEM}, Linux)
	@printf "${PRIMARY}unlimited execution time (default: 30)${NL}"
	@printf "${INFO}sudo sed -i -E s/\"^;?max_execution_time\s?=\s?\-?\d+$$\"/\"max_execution_time = -1\"/g /etc/php/${PHP_VERSION}/cli/php.ini${NL}"
	@sudo sed -i -E s/"^;?max_execution_time\s?=\s?\-?\d+$$"/"max_execution_time = -1"/g /etc/php/${PHP_VERSION}/cli/php.ini
	@printf "${PRIMARY}allow maximum memory usage (default: 128)${NL}"
	@printf "${INFO}sudo sed -i -E s/\"^;?memory_limit\s?=\s?\-?[\d\w]+$$\"/\"memory_limit = -1\"/g /etc/php/${PHP_VERSION}/cli/php.ini${NL}"
	@sudo sed -i -E s/"^;?memory_limit\s?=\s?\-?[\d\w]+$$"/"memory_limit = -1"/g /etc/php/${PHP_VERSION}/cli/php.ini
	@printf "${PRIMARY}unlimited upload file size (default: 2M)${NL}"
	@printf "${INFO}sudo sed -i -E s/\"^;?upload_max_filesize\s?=\s?\-?[\d\w]+$$\"/\"upload_max_filesize = -1\"/g /etc/php/${PHP_VERSION}/cli/php.ini${NL}"
	@sudo sed -i -E s/"^;?upload_max_filesize\s?=\s?\-?[\d\w]+$$"/"upload_max_filesize = -1"/g /etc/php/${PHP_VERSION}/cli/php.ini
	@printf "${PRIMARY}enable logging (default: On)${NL}"
	@printf "${INFO}sudo sed -i -E s/\"^;?log_errors\s?=\s?\w+$$\"/\"log_errors = On\"/g /etc/php/${PHP_VERSION}/cli/php.ini${NL}"
	@sudo sed -i -E s/"^;?log_errors\s?=\s?\w+$$"/"log_errors = On"/g /etc/php/${PHP_VERSION}/cli/php.ini
	@printf "${PRIMARY}show the presence of php (default: On)${NL}"
	@printf "${INFO}sudo sed -i -E s/\"^;?expose_php\s?=\s?\w+$$\"/\"expose_php = On\"/g /etc/php/${PHP_VERSION}/cli/php.ini${NL}"
	@sudo sed -i -E s/"^;?expose_php\s?=\s?\w+$$"/"expose_php = On"/g /etc/php/${PHP_VERSION}/cli/php.ini
endif

## PHP optimisation tasks for production
php-optimize: disable-xdebug
ifeq (${SYSTEM}, Linux)
	@printf "${INFO}$(shell which composer) dump-autoload --optimize --no-dev --classmap-authoritative${NL}"
	@$(shell which composer) dump-autoload --optimize --no-dev --classmap-authoritative
	@printf "${INFO}sudo sed -i -E s/\"^;?opcache.enable=\d$$\"/\"opcache.enable=1\"/g /etc/php/${PHP_VERSION}/cli/php.ini${NL}"
	@sudo sed -i -E s/"^;?opcache.enable=\d$$"/"opcache.enable=1"/g /etc/php/${PHP_VERSION}/cli/php.ini
	@printf "${INFO}sudo sed -i -E s/\"^;?opcache.memory_consumption=\d+$$\"/\"opcache.memory_consumption=256\"/g /etc/php/${PHP_VERSION}/cli/php.ini${NL}"
	@sudo sed -i -E s/"^;?opcache.memory_consumption=\d+$$"/"opcache.memory_consumption=256"/g /etc/php/${PHP_VERSION}/cli/php.ini
	@printf "${INFO}sudo sed -i -E s/\"^;?opcache.max_accelerated_files=\d+$$\"/\"opcache.max_accelerated_files=20000\"/g /etc/php/${PHP_VERSION}/cli/php.ini${NL}"
	@sudo sed -i -E s/"^;?opcache.max_accelerated_files=\d+$$"/"opcache.max_accelerated_files=20000"/g /etc/php/${PHP_VERSION}/cli/php.ini
	@printf "${INFO}sudo sed -i -E s/\"^;?opcache.validate_timestamps=\d$$\"/\"opcache.validate_timestamps=0\"/g /etc/php/${PHP_VERSION}/cli/php.ini${NL}"
	@sudo sed -i -E s/"^;?opcache.validate_timestamps=\d$$"/"opcache.validate_timestamps=0"/g /etc/php/${PHP_VERSION}/cli/php.ini
	@printf "${INFO}sudo sed -i -E s/\"^realpath_cache_size=\d$$\"/\"realpath_cache_size=4096k\"/g /etc/php/${PHP_VERSION}/cli/php.ini${NL}"
	@sudo sed -i -E s/"^realpath_cache_size=\d$$"/"realpath_cache_size=4096k"/g /etc/php/${PHP_VERSION}/cli/php.ini
	@printf "${INFO}sudo sed -i -E s/\"^realpath_cache_ttl=\d$$\"/\"realpath_cache_ttl=600\"/g /etc/php/${PHP_VERSION}/cli/php.ini${NL}"
	@sudo sed -i -E s/"^realpath_cache_ttl=\d$$"/"realpath_cache_ttl=600"/g /etc/php/${PHP_VERSION}/cli/php.ini
endif

## Disable xdebug
disable-xdebug:
ifeq (${SYSTEM}, Linux)
	@printf "${INFO}sudo sed -i -E s/\"^;?zend_extension=xdebug.so$$\"/\";zend_extension=xdebug.so\"/g $(shell php -i | grep xdebug.ini | tr -d ',')${NL}"
	@sudo sed -i -E s/"^;?zend_extension=xdebug.so$$"/";zend_extension=xdebug.so"/g $(shell php -i | grep xdebug.ini | tr -d ',')
endif

## Enable xdebug
enable-xdebug:
ifeq (${SYSTEM}, Linux)
	@printf "${INFO}sudo sed -i -E s/\"^;?zend_extension=xdebug.so$$\"/\"zend_extension=xdebug.so\"/g $(shell php -i | grep xdebug.ini | tr -d ',')${NL}";"
	sudo sed -i -E s/"^;?zend_extension=xdebug.so$$"/"zend_extension=xdebug.so"/g $(shell php -i | grep xdebug.ini | tr -d ',')
endif

