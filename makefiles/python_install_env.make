##################################################
### Python3 Local Install
##################################################

## Install development environment locally (python3, pip3 and virtualenv)
python-install:
ifeq (${SYSTEM}, Linux)
	@printf "${INFO}sudo apt-get update${NL}"
	-@sudo apt-get update
	@printf "${INFO}sudo apt-get install -y python3${NL}"
	@sudo apt-get install -y python3
	@printf "${INFO}sudo apt-get install -y python3-pip${NL}"
	@sudo apt-get install -y python3-pip
	@printf "${INFO}python3 -m pip install --upgrade pip${NL}"
	@python3 -m pip install --upgrade pip
	@printf "${INFO}sudo apt-get install -y python-virtualenv${NL}"
	@sudo apt-get install -y python-virtualenv
endif

## Update all pip packages locally
pip-update:
	@printf "${INFO}python3 -m pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 python3 -m pip install -U${NL}"
	@python3 -m pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 python3 -m pip install -U

