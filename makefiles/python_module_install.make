##################################################
### Python3 Module
##################################################

## Install module locally
install:
ifeq (${SYSTEM}, Linux)
	@printf "${INFO}sudo python3 setup.py install${NL}"
	-@sudo python3 setup.py install
endif

## Uninstall module
uninstall:
ifeq (${SYSTEM}, Linux)
	@printf "${INFO}sudo pip3 uninstall -y $(shell basename ${CURDIR})${NL}"
	-@sudo pip3 uninstall -y $(shell basename ${CURDIR})
	@printf "${INFO}sudo rm -rf build dist *.egg-info${NL}"
	@sudo rm -rf build dist *.egg-info
endif

