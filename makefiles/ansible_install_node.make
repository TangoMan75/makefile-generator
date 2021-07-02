##################################################
### ansible install node
##################################################

## Install ansible locally
ansible-install:
ifeq (${SYSTEM}, Linux)
	@printf "${INFO}sudo apt-get update${NL}"
	-@sudo apt-get update
	@printf "${INFO}sudo apt-get install -y ansible${NL}"
	@sudo apt-get install -y ansible
endif

## Install virtualenv and sshpass
ansible-init:
ifeq (${SYSTEM}, Linux)
	@printf "${INFO}sudo apt-get update${NL}"
	-@sudo apt-get update
	@printf "${INFO}sudo apt-get install -y python-virtualenv${NL}"
	@sudo apt-get install -y python-virtualenv
	@printf "${INFO}sudo apt-get install -y sshpass${NL}"
	@sudo apt-get install -y sshpass
endif

## Create ansible user
ansible-adduser:
ifeq (${SYSTEM}, Linux)
	@printf "${INFO}adduser user-ansible${NL}"
	@adduser user-ansible
	@printf "${INFO}sudo usermod -a -G docker ${USER}${NL}"
	@sudo usermod -a -G docker ${USER}
endif

## Create ansible virtualenv
ansible-create-virtualenv:
	@printf "${INFO}virtualenv ansible2.7.10${NL}"
	@virtualenv ansible2.7.10
	@printf "${INFO}source ansible2.7.10/bin/activate${NL}"
	@source ansible2.7.10/bin/activate

## Install ansible in virtualenv
ansible-install-virtualenv:
	@printf "${INFO}pip install ansible==2.7.10${NL}"
	@pip install ansible==2.7.10
	@printf "${INFO}ansible --version${NL}"
	@ansible --version

## List ansible config
ansible-config:
	@printf "${INFO}ansible-config list${NL}"
	@ansible-config list

