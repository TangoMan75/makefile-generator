#--------------------------------------------------
# Symfony Docker (depecated)
#--------------------------------------------------

image?=Dockerfile
# set default container name from current folder name (removing spaces, replacing ".", ":" and "/" by "-", to lowercase)
container?="$(shell basename ${CURDIR} | tr :/ - | tr -d ' ' | tr '[:upper:]' '[:lower:]')"
# guest working directory e.g: `/usr/src/app` (for bindind and hotreload)
workdir?=/www
# app path (will append to container's ip e.g: `http://172.17.0.2/index.php`)
app_route?=/index.php
# app port
port?=80
# command to execute on container startup
command?=php -S 0.0.0.0:${port} ${PUBLIC}
# valid parameter = bridge, host, macvlan or none (https://docs.docker.com/network)
network?=bridge

