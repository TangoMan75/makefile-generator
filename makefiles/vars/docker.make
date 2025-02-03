#--------------------------------------------------
# Docker (deprecated)
#--------------------------------------------------

# https://hub.docker.com/search
# 
# |     ubuntu    |            debian           | alpine | archlinux |     kalilinux     |
# |---------------|-----------------------------|--------|-----------|-------------------|
# | 20.04, focal  | bullseye                    | edge   |  20191205 | kali              |
# | 19.10, eoan   | 10.3, buster, buster-slim   | 3.11   |  20191105 | kali-rolling      |
# | 19.04, disco  | 9.11, stretch, stretch-slim | 3.10   |  20191006 | kali-linux-docker |
# | 18.04, bionic | 8.11, jessie, jessie-slim   | 3.9    |           |                   |
# | 16.04, xenial |                             | 3.8    |           |                   |
# | 14.04, trusty |                             |        |           |                   |

image?=
container?=

# when no container name given and Dockerfile present and git repository present
ifeq ($(shell test -z "${image}" && test -z "${container}" && test -f ./Dockerfile && test -n `git rev-parse --show-toplevel 2>/dev/null` && echo true),true)
	# set default container name from git repository name
	container="$(shell basename `git rev-parse --show-toplevel 2>/dev/null | tr '[:upper:]' '[:lower:]'` 2>/dev/null)"
endif

# when no container name given and Dockerfile present and no git repository found
ifeq ($(shell test -z "${image}" && test -z "${container}" && test -f ./Dockerfile && echo true),true)
	# set default container name from current folder name (removing spaces, replacing ".", ":" and "/" by "-", to lowercase)
	container="$(shell basename ${CURDIR} | tr :/ - | tr -d ' ' | tr '[:upper:]' '[:lower:]')"
endif

# when no image name given and Dockerfile present
ifeq ($(shell test -z "${image}" && test -f ./Dockerfile && echo true),true)
	# default image is debian:buster-slim
	image=Dockerfile
endif

# when no image name given and no Dockerfile present
ifeq ($(shell test -z "${image}" && test ! -f ./Dockerfile && echo true),true)
	# default image is debian:buster-slim
	image=debian:buster-slim
endif

# when no container name found
ifeq (${container},)
	# set default container name from image (removing spaces, replacing ".", ":" and "/" by "-", to lowercase)
	container=$(shell echo "${image}" | tr ":/." - | tr -d ' ' | tr '[:upper:]' '[:lower:]')
endif

# guest working directory e.g: `/usr/src/app` (for bindind and hotreload)
workdir?=/usr/src/app
# app path (will append to container's ip e.g: `http://172.17.0.2/index.php`)
app_route?=/index.php
# command to execute on container startup
command?=tail -f /dev/null

# Host network config
default_ethernet="$(shell ip token | cut -d\  -f4 | grep -E '^e' | head -n1)"
default_wifi="$(shell ip token | cut -d\  -f4 | grep -E '^w' | head -n1)"

adapter?=${default_ethernet}
# valid parameter = bridge, host, macvlan or none (https://docs.docker.com/network)
network?=bridge

