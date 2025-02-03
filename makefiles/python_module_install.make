##################################################
### Python3 Module
##################################################

## Install module locally
install:
ifeq (${SYSTEM}, Linux)
	@printf "${INFO}sudo python3 setup.py install${EOL}"
	-@sudo python3 setup.py install
endif

## Uninstall module
uninstall:
ifeq (${SYSTEM}, Linux)
	@printf "${INFO}sudo pip3 uninstall -y $(shell basename ${CURDIR})${EOL}"
	-@sudo pip3 uninstall -y $(shell basename ${CURDIR})
	@printf "${INFO}sudo rm -rf build dist *.egg-info${EOL}"
	@sudo rm -rf build dist *.egg-info
endif

