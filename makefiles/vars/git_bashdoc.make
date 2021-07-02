#--------------------------------------------------
# Git BashDoc
#--------------------------------------------------

# get values from `@link` TangoMan BashDoc
git_server?=`awk '/^\#\/\*\*$$/,/^\# \*\/$$/{}/^\# \* @link /{print}' ${MAKEFILE_LIST} 2>/dev/null | grep -m1 -oE '(bitbucket.org|github.com|gitlab.com)'`
git_user?=`awk '/^\#\/\*\*$$/,/^\# \*\/$$/{}/^\# \* @link /{print}' ${MAKEFILE_LIST} 2>/dev/null | grep -m1 -E '(bitbucket.org|github.com|gitlab.com)' | cut -d/ -f4`
repository?=`awk '/^\#\/\*\*$$/,/^\# \*\/$$/{}/^\# \* @link /{print}' ${MAKEFILE_LIST} 2>/dev/null | grep -m1 -E '(bitbucket.org|github.com|gitlab.com)' | cut -d/ -f5`

