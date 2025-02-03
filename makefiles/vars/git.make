#--------------------------------------------------
# Git
#--------------------------------------------------

# get version from git tag
version?=`git tag --list 2>/dev/null | tail -1`

# get lastest tag from git repository
version?=`git describe --exact-match --abbrev=0 2>/dev/null`

# get repository name from git
repository?=$(shell basename `git rev-parse --show-toplevel 2>/dev/null` 2>/dev/null)
ifeq (${repository},)
	# get default repository name from current folder name
	repository="$(shell basename ${CURDIR})"
endif

