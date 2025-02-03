#--------------------------------------------------
# Help
#--------------------------------------------------

## Print this help
help:
	@printf "${LIGHT} TangoMan Makefile Generator ${EOL}\n"

	@printf "${WARNING}Description${EOL}"
	@printf "${PRIMARY}  Generate Makefiles with one single command${EOL}"
	@printf "${PRIMARY}  Prefix \"*.make\" files from \"./makefiles\" with underscore to concatenate${EOL}\n"

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

