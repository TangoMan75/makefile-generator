#--------------------------------------------------
# Help
#--------------------------------------------------

## Print this help
help:
	@printf "${LIGHT} {{ PROJECT }} $(shell basename ${CURDIR}) ${EOL}\n"

	@printf "${WARNING}Infos${EOL}"
	@printf "${SUCCESS}  %-{{ PADDING }}s${INFO} %s${EOL}" "login"     "$(shell whoami)"
	@printf "${SUCCESS}  %-{{ PADDING }}s${INFO} %s${EOL}" "system"    "$(shell uname -s)"
	@printf "${SUCCESS}  %-{{ PADDING }}s${INFO} %s${EOL}" "httpduser" "${HTTPDUSER}"
	@printf "${SUCCESS}  %-{{ PADDING }}s${INFO} %s${EOL}" "port"      "${port}"
	@printf "${SUCCESS}  %-{{ PADDING }}s${INFO} %s${EOL}" "php"       "${PHP_VERSION}"
	@printf "${SUCCESS}  %-{{ PADDING }}s${INFO} %s${EOL}" "Symfony"   "${VERSION}"
	@printf "${EOL}"

	@printf "${WARNING}Description${EOL}"
	@printf "${PRIMARY}  {{ DESCRIPTION }}${EOL}\n"

	@printf "${WARNING}Usage${EOL}"
	@printf "${PRIMARY}  make [command] `awk -F '?' '/^[ \t]+?[a-zA-Z0-9_-]+[ \t]+?\?=/{gsub(/[ \t]+/,"");printf"%s=[%s]\n",$$1,$$1}' ${MAKEFILE_LIST}|sort|uniq|tr '\n' ' '`${EOL}\n"

	@printf "${WARNING}Config${EOL}"
	$(eval CONFIG:=$(shell awk -F '?' '/^[ \t]+?[a-zA-Z0-9_-]+[ \t]+?\?=/{gsub(/[ \t]+/,"");printf"$${SECONDARY} %-12s$${DEFAULT}  $${INFO}$${%s}$${EOL}\n",$$1,$$1}' ${MAKEFILE_LIST}|sort|uniq))
	@printf " ${CONFIG}\n"

	@printf "${WARNING}Commands${EOL}"
	@awk '/^### /{printf"\n${WARNING}%s${EOL}",substr($$0,5)} \
	/^[a-zA-Z0-9_-]+:/{HELP="";if( match(PREV,/^## /))HELP=substr(PREV, 4); \
		printf "${SUCCESS}  %-12s  ${PRIMARY}%s${EOL}",substr($$1,0,index($$1,":")-1),HELP \
	}{PREV=$$0}' ${MAKEFILE_LIST}

