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
	@printf "${DANGER}error: \"./makefiles\" source folder not found${EOL}"
	@exit 1
endif

	@printf "${PRIMARY}print header block${EOL}"
ifeq ($(shell test -f ./makefiles/header/_header*.make && echo true),true)
	@printf "${INFO}cp ./makefiles/header/_header*.make ./build/${filename}${EOL}"
	@cp ./makefiles/header/_header*.make ./build/${filename}
else
	@printf "${INFO}cp ./makefiles/header/header_default.make ./build/${filename}${EOL}"
	@cp ./makefiles/header/header_default.make ./build/${filename}
endif

	@printf "${PRIMARY}print colors${EOL}"
ifeq ($(shell test ! -f ./makefiles/vars/_colors.make && echo true),true)
	@printf "${INFO}cat ./makefiles/vars/colors_default.make >> ./build/${filename}${EOL}"
	-@cat ./makefiles/vars/colors_default.make >> ./build/${filename}
endif

	@printf "${PRIMARY}print vars block${EOL}"
ifeq ($(shell ! test -f ./makefiles/vars/_*.make && echo true),true)
	@printf "${WARNING}no templates found in \"./makefiles/vars\"${EOL}"
else
	@printf "${INFO}cat ./makefiles/vars/_*.make >> ./build/${filename}${EOL}"
	-@cat ./makefiles/vars/_*.make >> ./build/${filename}
endif

	@printf "${PRIMARY}print help block${EOL}"
ifeq ($(shell test -f ./makefiles/header/_help*.make && echo true),true)
	@printf "${INFO}cat ./makefiles/header/_help*.make >> ./build/${filename}${EOL}"
	-@cat ./makefiles/header/_help*.make >> ./build/${filename}
else
	@printf "${INFO}cat ./makefiles/header/help_default.make >> ./build/${filename}${EOL}"
	-@cat ./makefiles/header/help_default.make >> ./build/${filename}
endif

	@printf "${PRIMARY}print makefile rules block${EOL}"
ifeq ($(shell test -f ./makefile/_*.make && echo true),true)
	@printf "${WARNING}no templates found in \"./makefiles\"${EOL}"
else
	@printf "${INFO}cat ./makefiles/_*.make >> ./build/${filename}${EOL}"
	-@cat ./makefiles/_*.make >> ./build/${filename}
endif
	#@ can't read from file while writing in the same rule apparently
	@$(eval phony:=".PHONY:")

	@$(call render,./build/${filename})
	@printf "${SUCCESS}${filename} generated.${EOL}"

## Update ".PHONY:" rule
phony:
	@printf "${PRIMARY}update phony rule${EOL}"
	@$(call get_phony,./build/${filename})
	@$(eval phony:=.PHONY: ${phony})
	@printf "${PRIMARY}${phony}${EOL}"
	@sed -i s/"^\.PHONY:.*"/"${phony}"/g ./build/${filename}

## Generate "README.md"
readme: init
	@printf "${INFO}cp ./templates/README.md ./build/README.md${EOL}"
	@cp ./templates/README.md ./build/README.md
ifeq ($(shell test -f ./build/${filename} && echo true),true)
	@printf "${INFO}get phony${EOL}"
	@$(call get_phony,./build/${filename})
	@printf "${INFO}$(phony)${EOL}"

	@printf "${INFO}get usage${EOL}"
	@$(call get_usage,./build/${filename})
	@printf "${INFO}$(usage)${EOL}"

	@printf "${INFO}get markdown${EOL}"
	@printf "${INFO}$(shell awk '/^### /{printf"### %s\\n",substr($$0, 5)}/^[a-zA-Z0-9_-]+:/{if(match(PREV,/^## /)) HELP=substr(PREV,4);else HELP="";RULE=substr($$1,0,index($$1,":")-1);printf"#### ⚡ %s\\n\\`\\`\\`bash\\n$$ make %s\\n\\`\\`\\`\\n\\n",HELP,RULE}{PREV=$$0}' ./build/${filename} | tr '/' '-')${EOL}"
	@sed -i s/'{{ MARKDOWN }}'/"$(shell awk '/^### /{printf"### %s\\n",substr($$0, 5)}/^[a-zA-Z0-9_-]+:/{if(match(PREV,/^## /)) HELP=substr(PREV,4);else HELP="";RULE=substr($$1,0,index($$1,":")-1);printf"#### ⚡ %s\\n\\`\\`\\`bash\\n$$ make %s\\n\\`\\`\\`\\n\\n",HELP,RULE}{PREV=$$0}' ./build/${filename} | tr '/' '-')"/g ./build/README.md
endif
	@$(call render,./build/README.md)
	@printf "${SUCCESS}README.md generated.${EOL}"

## Generate "LICENSE"
license: init
ifeq ($(shell echo ${license}),Apache)
	@printf "${INFO}cp ./templates/APACHE.txt ./build/LICENSE${EOL}"
	@cp ./templates/APACHE.txt ./build/LICENSE
endif
ifeq ($(shell echo ${license}),GPL2)
	@printf "${INFO}cp ./templates/GPL2.txt ./build/LICENSE${EOL}"
	@cp ./templates/GPL2.txt ./build/LICENSE
endif
ifeq ($(shell echo ${license}),GPL3)
	@printf "${INFO}cp ./templates/GPL3.txt ./build/LICENSE${EOL}"
	@cp ./templates/GPL3.txt ./build/LICENSE
endif
ifeq ($(shell echo ${license}),MIT)
	@printf "${INFO}cp ./templates/MIT.txt ./build/LICENSE${EOL}"
	@cp ./templates/MIT.txt ./build/LICENSE
endif
	@$(call render,./build/LICENSE)
	@printf "${SUCCESS}LICENSE generated.${EOL}"

## Generate "CHANGELOG.md"
changelog: init
	@printf "${INFO}cp ./templates/CHANGELOG.md ./build/CHANGELOG.md${EOL}"
	@cp ./templates/CHANGELOG.md ./build/CHANGELOG.md
	@$(call render,./build/CHANGELOG.md)
	@printf "${SUCCESS}CHANGELOG.md generated.${EOL}"

## Generate "CODE_OF_CONDUCT.md"
code: init
	@printf "${INFO}cp ./templates/CODE_OF_CONDUCT.md ./build/CODE_OF_CONDUCT.md${EOL}"
	@cp ./templates/CODE_OF_CONDUCT.md ./build/CODE_OF_CONDUCT.md
	@$(call render,./build/CODE_OF_CONDUCT.md)
	@printf "${SUCCESS}CODE_OF_CONDUCT.md generated.${EOL}"

## Generate "CONTRIBUTING.md"
contrib: init
	@printf "${INFO}cp ./templates/CONTRIBUTING.md ./build/CONTRIBUTING.md${EOL}"
	@cp ./templates/CONTRIBUTING.md ./build/CONTRIBUTING.md
	@$(call render,./build/CONTRIBUTING.md)
	@printf "${SUCCESS}CONTRIBUTING.md generated.${EOL}"

## Copy CI/CD tools
ci-cd: init
	@printf "${INFO}cp -r ./templates/.github ./build/${EOL}"
	@cp -r ./templates/.github ./build/
	@printf "${SUCCESS}.github copied.${EOL}"
	@printf "${INFO}cp ./templates/run_linter.sh ./build/${EOL}"
	@cp ./templates/run_linter.sh ./build/
	@printf "${SUCCESS}run_linter.sh copied.${EOL}"
	@printf "${INFO}cp ./templates/run_tests.sh ./build/${EOL}"
	@cp ./templates/run_tests.sh ./build/
	@printf "${SUCCESS}run_tests.sh copied.${EOL}"

## Create "config.yaml" and "./build" folder
init:
ifeq ($(shell test ! -d ./build && echo true),true)
	@printf "${INFO}mkdir ./build${EOL}"
	@mkdir ./build
endif
ifeq ($(shell test ! -f ./config.yaml && echo true),true)
	@if [ -f ./config.yaml.dist ]; then \
		printf "${INFO}cp ./config.yaml.dist ./config.yaml${EOL}"; \
		cp ./config.yaml.dist ./config.yaml; \
	fi
	@$(call render,./config.yaml)
endif

## Remove "config.yml" "./build" and all "_template.make" files
clean:
	@printf "${INFO}rm config.yaml${EOL}"
	-@rm config.yaml
	@printf "${INFO}rm -rf ./build${EOL}"
	-@rm -rf ./build
	@printf "${INFO}rm ./makefiles/_*.make${EOL}"
	-@rm ./makefiles/_*.make
	@printf "${INFO}rm ./makefiles/header/_*.make${EOL}"
	-@rm ./makefiles/header/_*.make
	@printf "${INFO}rm ./makefiles/vars/_*.make${EOL}"
	-@rm ./makefiles/vars/_*.make

