#--------------------------------------------------
# Help
#--------------------------------------------------

## Print this help
help:
	@printf "${LIGHT} {{ PROJECT }} ${container} ${NL}"

	@printf "${WARNING}Infos${NL}"
	@printf "${SUCCESS}  %-{{ PADDING }}s${INFO} %s${NL}" "image"     "${image}"
	@printf "${SUCCESS}  %-{{ PADDING }}s${INFO} %s${NL}" "container" "${container}"
	@printf "${SUCCESS}  %-{{ PADDING }}s${INFO} %s${NL}" "ethernet"  "${default_ethernet}"
	@printf "${SUCCESS}  %-{{ PADDING }}s${INFO} %s${NL}" "wifi"      "${default_wifi}"
	@printf "${NL}"

	@printf "${WARNING}Description${NL}"
	@printf "${PRIMARY}  {{ DESCRIPTION }}${NL}\n"

	@printf "${WARNING}Usage${NL}"
	@printf "${PRIMARY}  make [command] `awk -F '?' '/^[ \t]+?[a-zA-Z0-9_-]+[ \t]+?\?=/{gsub(/[ \t]+/,"");printf"%s=[%s]\n",$$1,$$1}' ${MAKEFILE_LIST}|sort|uniq|tr '\n' ' '`${NL}\n"

	@printf "${WARNING}Config${NL}"
	$(eval CONFIG:=$(shell awk -F '?' '/^[ \t]+?[a-zA-Z0-9_-]+[ \t]+?\?=/{gsub(/[ \t]+/,"");printf"$${SECONDARY} %-12s$${DEFAULT}  $${INFO}$${%s}$${NL}\n",$$1,$$1}' ${MAKEFILE_LIST}|sort|uniq))
	@printf " ${CONFIG}\n"

	@printf "${WARNING}Commands${NL}"
	@awk '/^### /{printf"\n${WARNING}%s${NL}",substr($$0,5)} \
	/^[a-zA-Z0-9_-]+:/{HELP="";if( match(PREV,/^## /))HELP=substr(PREV, 4); \
		printf "${SUCCESS}  %-12s  ${PRIMARY}%s${NL}",substr($$1,0,index($$1,":")-1),HELP \
	}{PREV=$$0}' ${MAKEFILE_LIST}

