#/**
# * TangoMan Makefile Generator
# *
# * Run `make` to print help.
# * Add help for a rule by prexixing a comment with two pound signs on the previous line.
# * Optionally use three signs to group rules by categories.
# *
# * @version 0.1.0
# * @author  "Matthias Morin" <mat@tangoman.io>
# * @license MIT
# * @link    https://github.com/TangoMan75/makefile-generator
# */

.PHONY: help generate makefile phony readme license changelog code contrib ci-cd init clean

#--------------------------------------------------
# Colors
#--------------------------------------------------

PRIMARY   = \033[97m
SECONDARY = \033[94m
SUCCESS   = \033[32m
DANGER    = \033[31m
WARNING   = \033[33m
INFO      = \033[95m
LIGHT     = \033[47;90m
DARK      = \033[40;37m
DEFAULT   = \033[0m
EOL       = \033[0m\n

ALERT_PRIMARY   = \033[1;104;97m
ALERT_SECONDARY = \033[1;45;97m
ALERT_SUCCESS   = \033[1;42;97m
ALERT_DANGER    = \033[1;41;97m
ALERT_WARNING   = \033[1;43;97m
ALERT_INFO      = \033[1;44;97m
ALERT_LIGHT     = \033[1;47;90m
ALERT_DARK      = \033[1;40;37m

#--------------------------------------------------
# Color Functions
#--------------------------------------------------

define echo_primary
	@printf "${PRIMARY}%b${EOL}" $(1)
endef
define echo_secondary
	@printf "${SECONDARY}%b${EOL}" $(1)
endef
define echo_success
	@printf "${SUCCESS}%b${EOL}" $(1)
endef
define echo_danger
	@printf "${DANGER}%b${EOL}" $(1)
endef
define echo_warning
	@printf "${WARNING}%b${EOL}" $(1)
endef
define echo_info
	@printf "${INFO}%b${EOL}" $(1)
endef
define echo_light
	@printf "${LIGHT}%b${EOL}" $(1)
endef
define echo_dark
	@printf "${DARK}%b${EOL}" $(1)
endef

define echo_label
	@printf "${SUCCESS}%b ${DEFAULT}" $(1)
endef
define echo_error
	@printf "${DANGER}error: %b${EOL}" $(1)
endef

define alert_primary
	@printf "${EOL}${ALERT_PRIMARY}%64s${EOL}${ALERT_PRIMARY} %-63s${EOL}${ALERT_PRIMARY}%64s${EOL}\n" "" $(1) ""
endef
define alert_secondary
	@printf "${EOL}${ALERT_SECONDARY}%64s${EOL}${ALERT_SECONDARY} %-63s${EOL}${ALERT_SECONDARY}%64s${EOL}\n" "" $(1) ""
endef
define alert_success
	@printf "${EOL}${ALERT_SUCCESS}%64s${EOL}${ALERT_SUCCESS} %-63s${EOL}${ALERT_SUCCESS}%64s${EOL}\n" "" $(1) ""
endef
define alert_danger
	@printf "${EOL}${ALERT_DANGER}%64s${EOL}${ALERT_DANGER} %-63s${EOL}${ALERT_DANGER}%64s${EOL}\n" "" $(1) ""
endef
define alert_warning
	@printf "${EOL}${ALERT_WARNING}%64s${EOL}${ALERT_WARNING} %-63s${EOL}${ALERT_WARNING}%64s${EOL}\n" "" $(1) ""
endef
define alert_info
	@printf "${EOL}${ALERT_INFO}%64s${EOL}${ALERT_INFO} %-63s${EOL}${ALERT_INFO}%64s${EOL}\n" "" $(1) ""
endef
define alert_light
	@printf "${EOL}${ALERT_LIGHT}%64s${EOL}${ALERT_LIGHT} %-63s${EOL}${ALERT_LIGHT}%64s${EOL}\n" "" $(1) ""
endef
define alert_dark
	@printf "${EOL}${ALERT_DARK}%64s${EOL}${ALERT_DARK} %-63s${EOL}${ALERT_DARK}%64s${EOL}\n" "" $(1) ""
endef

#--------------------------------------------------
# Makefile Generator
#--------------------------------------------------

# get parameters from config.yaml
# NOTE: "$(1)" in make "define" functions refers to the first given parameter
define get_param
	cat ./config.yaml | sed -nE 's/^(\s+)?$(1)://p' | sed -E 's/^\s+//g'
endef

# get phony from file
# NOTE: "eval" allows to set variables in global scope
# NOTE: ":=" allows to set variable as value
define get_phony
	$(eval phony:=$(shell awk -F ':' '/^[a-zA-Z0-9_-]+:/{printf "%s ", $$1}' $(1)))
endef

# get usage from file
define get_usage
	$(eval usage:=$(shell awk -F '?' '/^[ \t]+?[a-zA-Z0-9_-]+[ \t]+?\?=/{gsub(/[ \t]+/,"");printf "%s=[%s]\n", $$1, $$1}' $(1)|sort|uniq|tr '\n' ' '))
endef

# render template (phony and usage are generated - can't edit)
define render
	@sed -i s/'{{ AUTHOR }}'/"$(author)"/g $(1)
	@sed -i s/'{{ DESCRIPTION }}'/"$(description)"/g $(1)
	@sed -i s/'{{ EMAIL }}'/"$(email)"/g $(1)
	@sed -i s/'{{ FILENAME }}'/"$(filename)"/g $(1)
	@sed -i s/'{{ GIT_SERVER }}'/"$(git_server)"/g $(1)
	@sed -i s/'{{ GIT_USER }}'/"$(git_user)"/g $(1)
	@sed -i s/'{{ LICENSE }}'/"$(license)"/g $(1)
	@sed -i s/'{{ PADDING }}'/"$(padding)"/g $(1)
	@sed -i s/'{{ PHONY }}'/"$(phony)"/g $(1)
	@sed -i s/'{{ PROJECT }}'/"$(project)"/g $(1)
	@sed -i s/'{{ REPOSITORY }}'/"$(repository)"/g $(1)
	@sed -i s/'{{ USAGE }}'/"$(usage)"/g $(1)
	@sed -i s/'{{ VERSION }}'/"$(version)"/g $(1)
	@sed -i s/'{{ YEAR }}'/"$(year)"/g $(1)
endef

# parameters (usage parameter=value)
ifeq ($(shell test ! -f ./config.yaml && echo true),true)
	# set default config (from this actual file header)
	author?=`awk '/^\#\/\*\*$$/,/^\# \*\/$$/{}/^\# \* @author /{print}' ${MAKEFILE_LIST} 2>/dev/null | grep -m1 -oE '\".+\"' | tr -d '"'`
	description?=`awk '/^\# \* @/ {i=2} /^\#\/\*\*$$/,/^\# \*\/$$/{i+=1; if (i>3) printf "%s ", substr($$0, 5)}' ${MAKEFILE_LIST} 2>/dev/null`
	email?=`awk '/^\#\/\*\*$$/,/^\# \*\/$$/{}/^\# \* @author /{print}' ${MAKEFILE_LIST} 2>/dev/null | grep -m1 -oE '<.+>' | tr -d '<' | tr -d '>'`
	filename?=Makefile
	git_server?=`awk '/^\#\/\*\*$$/,/^\# \*\/$$/{}/^\# \* @link /{print}' ${MAKEFILE_LIST} 2>/dev/null | grep -m1 -oE '(bitbucket.org|github.com|gitlab.com)'`
	git_user?=`awk '/^\#\/\*\*$$/,/^\# \*\/$$/{}/^\# \* @link /{print}' ${MAKEFILE_LIST} 2>/dev/null | grep -m1 -E '(bitbucket.org|github.com|gitlab.com)' | cut -d/ -f4`
	license?=`awk '/^\#\/\*\*$$/,/^\# \*\/$$/{}/^\# \* @license /{print}' ${MAKEFILE_LIST} 2>/dev/null | grep -m1 -oE '(Apache|GPL2|GPL3|MIT)'`
	padding?=12
	project?=`awk '/^\#\/\*\*$$/,/^\# \*\/$$/{i+=1; if (i==2) print substr($$0, 5)}' ${MAKEFILE_LIST} 2>/dev/null`
	repository?=`awk '/^\#\/\*\*$$/,/^\# \*\/$$/{}/^\# \* @link /{print}' ${MAKEFILE_LIST} 2>/dev/null | grep -m1 -E '(bitbucket.org|github.com|gitlab.com)' | cut -d/ -f5`
	version?=`awk '/^\#\/\*\*$$/,/^\# \*\/$$/{}/^\# \* @version /{print}' ${MAKEFILE_LIST} 2>/dev/null | grep -m1 -oP '\d+\.\d+\.\d+'`
	year?=`date +%Y`
else
	# get config from config.yaml
	author?=`$(call get_param,author)`
	description?=`$(call get_param,description)`
	email?=`$(call get_param,email)`
	filename?=`$(call get_param,filename)`
	git_server?=`$(call get_param,git_server)`
	git_user?=`$(call get_param,git_user)`
	license?=`$(call get_param,license)`
	padding?=`$(call get_param,padding)`
	project?=`$(call get_param,project)`
	repository?=`$(call get_param,repository)`
	version?=`$(call get_param,version)`
	year?=`$(call get_param,year)`
endif

#--------------------------------------------------
# Help
#--------------------------------------------------

## Print this help
help:
	$(call alert_primary, 'TangoMan Makefile Generator')

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

##################################################
### Generator
##################################################

## Generate all
generate:
	-@make --no-print-directory makefile
	-@make --no-print-directory phony
	-@make --no-print-directory readme
	-@make --no-print-directory license
	-@make --no-print-directory changelog
	-@make --no-print-directory code
	-@make --no-print-directory contrib
	-@make --no-print-directory ci-cd

## Generate "Makefile"
makefile: init
ifeq ($(shell test ! -d ./makefiles && echo true),true)
	$(call echo_danger, 'error: "./makefiles" source folder not found')
	@exit 1
endif

	$(call echo_secondary, 'print header block')
ifeq ($(shell test -f ./makefiles/header/_header*.make && echo true),true)
	$(call echo_info, "cp ./makefiles/header/_header*.make ./build/${filename}")
	@cp ./makefiles/header/_header*.make ./build/${filename}
else
	$(call echo_info, "cp ./makefiles/header/header_default.make ./build/${filename}")
	@cp ./makefiles/header/header_default.make ./build/${filename}
endif

	$(call echo_secondary, 'print colors')
ifeq ($(shell test -f ./makefiles/colors/_colors*.make && echo true),true)
	$(call echo_info, "cat ./makefiles/colors/_colors*.make >> ./build/${filename}")
	@cat ./makefiles/colors/_colors*.make >> ./build/${filename}
else
	$(call echo_info, "cat ./makefiles/colors/colors_default.make >> ./build/${filename}")
	@cat ./makefiles/colors/colors_default.make >> ./build/${filename}
endif

	$(call echo_secondary, 'print vars block')
ifeq ($(shell ! test -f ./makefiles/vars/_*.make && echo true),true)
	$(call echo_warning, 'no templates found in "./makefiles/vars"')
else
	$(call echo_info, "cat ./makefiles/vars/_*.make >> ./build/${filename}")
	-@cat ./makefiles/vars/_*.make >> ./build/${filename}
endif

	$(call echo_secondary, 'print help block')
ifeq ($(shell test -f ./makefiles/header/_help*.make && echo true),true)
	$(call echo_info, "cat ./makefiles/header/_help*.make >> ./build/${filename}")
	-@cat ./makefiles/header/_help*.make >> ./build/${filename}
else
	$(call echo_info, "cat ./makefiles/header/help_default.make >> ./build/${filename}")
	-@cat ./makefiles/header/help_default.make >> ./build/${filename}
endif

	$(call echo_secondary, 'print makefile rules block')
ifeq ($(shell ! test -f ./makefile/_*.make && echo true),true)
	$(call echo_warning, 'no templates found in "./makefiles"')
else
	$(call echo_info, "cat ./makefiles/_*.make >> ./build/${filename}")
	-@cat ./makefiles/_*.make >> ./build/${filename}
endif
	@# can't read from file while writing in the same rule apparently
	@$(eval phony:=".PHONY:")

	$(call render,./build/${filename})
	$(call echo_success, "${filename} generated.")

## Update ".PHONY:" rule
phony:
	$(call echo_secondary, 'update phony rule')
	$(call get_phony,./build/${filename})
	@$(eval phony:=.PHONY: ${phony})
	$(call echo_secondary, '${phony}')
	@sed -i s/"^\.PHONY:.*"/"${phony}"/g ./build/${filename}

## Generate "README.md"
readme: init
	$(call echo_info, 'cp ./templates/README.md ./build/README.md')
	@cp ./templates/README.md ./build/README.md
	$(call echo_info, 'cp ./templates/README_FR.md ./build/README_FR.md')
	@cp ./templates/README_FR.md ./build/README_FR.md

ifeq ($(shell test -f ./build/${filename} && echo true),true)
	$(call echo_info, 'get phony')
	$(call get_phony,./build/${filename})
	$(call echo_info, '$(phony)')

	$(call echo_info, 'get usage')
	$(call get_usage,./build/${filename})
	$(call echo_info, '$(usage)')

	$(call echo_info, 'get markdown')
	$(call echo_info, "$(shell awk '/^### /{printf"### %s\\n",substr($$0, 5)}/^[a-zA-Z0-9_-]+:/{if(match(PREV,/^## /)) HELP=substr(PREV,4);else HELP="";RULE=substr($$1,0,index($$1,":")-1);printf"#### ⚡ %s\\n\\`\\`\\`bash\\n$$ make %s\\n\\`\\`\\`\\n\\n",HELP,RULE}{PREV=$$0}' ./build/${filename} | tr '/' '-')")
	@sed -i s/'{{ MARKDOWN }}'/"$(shell awk '/^### /{printf"### %s\\n",substr($$0, 5)}/^[a-zA-Z0-9_-]+:/{if(match(PREV,/^## /)) HELP=substr(PREV,4);else HELP="";RULE=substr($$1,0,index($$1,":")-1);printf"#### ⚡ %s\\n\\`\\`\\`bash\\n$$ make %s\\n\\`\\`\\`\\n\\n",HELP,RULE}{PREV=$$0}' ./build/${filename} | tr '/' '-')"/g ./build/README.md
endif
	$(call render,./build/README.md)
	$(call echo_success, 'README.md generated.')
	$(call render,./build/README_FR.md)
	$(call echo_success, 'README_FR.md generated.')

## Generate "LICENSE"
license: init
ifeq ($(shell echo ${license}),Apache)
	$(call echo_info, 'cp ./templates/APACHE.txt ./build/LICENSE')
	@cp ./templates/APACHE.txt ./build/LICENSE
endif
ifeq ($(shell echo ${license}),GPL2)
	$(call echo_info, 'cp ./templates/GPL2.txt ./build/LICENSE')
	@cp ./templates/GPL2.txt ./build/LICENSE
endif
ifeq ($(shell echo ${license}),GPL3)
	$(call echo_info, 'cp ./templates/GPL3.txt ./build/LICENSE')
	@cp ./templates/GPL3.txt ./build/LICENSE
endif
ifeq ($(shell echo ${license}),MIT)
	$(call echo_info, 'cp ./templates/MIT.txt ./build/LICENSE')
	@cp ./templates/MIT.txt ./build/LICENSE
endif
	$(call render,./build/LICENSE)
	$(call echo_success, 'LICENSE generated.')

## Generate "CHANGELOG.md"
changelog: init
	$(call echo_info, 'cp ./templates/CHANGELOG.md ./build/CHANGELOG.md')
	@cp ./templates/CHANGELOG.md ./build/CHANGELOG.md
	$(call render,./build/CHANGELOG.md)
	$(call echo_success, 'CHANGELOG.md generated.')

## Generate "CODE_OF_CONDUCT.md"
code: init
	$(call echo_info, 'cp ./templates/CODE_OF_CONDUCT.md ./build/CODE_OF_CONDUCT.md')
	@cp ./templates/CODE_OF_CONDUCT.md ./build/CODE_OF_CONDUCT.md
	$(call render,./build/CODE_OF_CONDUCT.md)
	$(call echo_success, 'CODE_OF_CONDUCT.md generated.')

## Generate "CONTRIBUTING.md"
contrib: init
	$(call echo_info, 'cp ./templates/CONTRIBUTING.md ./build/CONTRIBUTING.md')
	@cp ./templates/CONTRIBUTING.md ./build/CONTRIBUTING.md
	$(call render,./build/CONTRIBUTING.md)
	$(call echo_success, 'CONTRIBUTING.md generated.')

## Copy CI/CD tools
ci-cd: init
	$(call echo_info, 'cp -r ./templates/.github ./build/')
	@cp -r ./templates/.github ./build/
	$(call echo_success, '.github copied.')
	$(call echo_info, 'cp ./templates/entrypoint.sh ./build/')
	@cp ./templates/entrypoint.sh ./build/
	$(call echo_success, 'entrypoint.sh copied.')

## Create "config.yaml" and "./build" folder
init:
ifeq ($(shell test ! -d ./build && echo true),true)
	$(call echo_info, 'mkdir ./build')
	@mkdir ./build
endif
ifeq ($(shell test ! -f ./config.yaml && echo true),true)
	@if [ -f ./config.yaml.dist ]; then \
		printf "${INFO}cp ./config.yaml.dist ./config.yaml${EOL}"; \
		cp ./config.yaml.dist ./config.yaml; \
	fi
	$(call render,./config.yaml)
endif

## Remove "config.yml" "./build" and all "template/_*.make" files
clean:
	$(call echo_info, 'rm config.yaml')
	-@rm config.yaml
	$(call echo_info, 'rm -rf ./build')
	-@rm -rf ./build
	$(call echo_info, 'rm ./makefiles/_*.make')
	-@rm ./makefiles/_*.make
	$(call echo_info, 'rm ./makefiles/header/_*.make')
	-@rm ./makefiles/header/_*.make
	$(call echo_info, 'rm ./makefiles/vars/_*.make')
	-@rm ./makefiles/vars/_*.make

