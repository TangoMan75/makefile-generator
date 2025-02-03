#--------------------------------------------------
# Help
#--------------------------------------------------

## Print this help
help:
	@printf "${LIGHT} {{ PROJECT }} ${container} ${EOL}"

	@printf "${WARNING}Infos${EOL}"
	@printf "${SUCCESS}  %-{{ PADDING }}s${INFO} %s${EOL}" "image"     "${image}"
	@printf "${SUCCESS}  %-{{ PADDING }}s${INFO} %s${EOL}" "container" "${container}"
	@printf "${SUCCESS}  %-{{ PADDING }}s${INFO} %s${EOL}" "ethernet"  "${default_ethernet}"
	@printf "${SUCCESS}  %-{{ PADDING }}s${INFO} %s${EOL}" "wifi"      "${default_wifi}"
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

