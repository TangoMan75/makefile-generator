#--------------------------------------------------
# Makefile Generator
#--------------------------------------------------

# get parameters from config.yaml
define get_param
	cat ./config.yaml | sed -nE 's/^(\s+)?$(1)://p' | sed -E 's/^\s+//g'
endef

# get phony from file
define update_phony
	$(eval phony:=$(shell awk -F ':' '/^[a-zA-Z0-9_-]+:/{printf "%s ", $$1}' $(1)))
endef

# get usage from file
define update_usage
	$(eval usage:=$(shell awk -F '?' '/^[ \t]+?[a-zA-Z0-9_-]+[ \t]+?\?=/{gsub(/[ \t]+/,"");printf "%s=[%s]\n", $$1, $$1}' $(1)|sort|uniq|tr '\n' ' '))
endef

# render template (phony and usage are generated - can't edit)
define render
	sed -i s/'{{ AUTHOR }}'/"${author}"/g $(1)
	sed -i s/'{{ DESCRIPTION }}'/"${description}"/g $(1)
	sed -i s/'{{ EMAIL }}'/"${email}"/g $(1)
	sed -i s/'{{ FILENAME }}'/"${filename}"/g $(1)
	sed -i s/'{{ GIT_SERVER }}'/"${git_server}"/g $(1)
	sed -i s/'{{ GIT_USER }}'/"${git_user}"/g $(1)
	sed -i s/'{{ LICENSE }}'/"${license}"/g $(1)
	sed -i s/'{{ PADDING }}'/"${padding}"/g $(1)
	sed -i s/'{{ PHONY }}'/"${phony}"/g $(1)
	sed -i s/'{{ PROJECT }}'/"${project}"/g $(1)
	sed -i s/'{{ REPOSITORY }}'/"${repository}"/g $(1)
	sed -i s/'{{ USAGE }}'/"${usage}"/g $(1)
	sed -i s/'{{ VERSION }}'/"${version}"/g $(1)
	sed -i s/'{{ YEAR }}'/"${year}"/g $(1)
endef

# parameters (usage parameter=value)
ifeq ($(shell test ! -f ./config.yaml && echo true),true)
	# set default config (from this actual file header)
	author?=`awk '/^\#\/\*\*$$/,/^\# \*\/$$/{}/^\# \* @author /{print}' ${MAKEFILE_LIST} 2>/dev/null | grep -m1 -oE '\".+\"' | tr -d '"'`
	description?=`awk '/^\# \* @/ {i=2} /^\#\/\*\*$$/,/^\# \*\/$$/{i+=1; if (i>3) printf "%s ", substr($$0, 5)}' ${MAKEFILE_LIST} 2>/dev/null`
	email?=`awk '/^\#\/\*\*$$/,/^\# \*\/$$/{}/^\# \* @author /{print}' ${MAKEFILE_LIST} 2>/dev/null | grep -m1 -oE '<.+>' | tr -d '<' | tr -d '>'`
	filename?=`date +%Y%m%d%H%M%S`.make
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


