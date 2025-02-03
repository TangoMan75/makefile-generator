##################################################
### ansible install node
##################################################

## Install ansible locally
ansible-install:
ifeq (${SYSTEM}, Linux)
	@printf "${INFO}sudo apt-get update${EOL}"
	-@sudo apt-get update
	@printf "${INFO}sudo apt-get install -y ansible${EOL}"
	@sudo apt-get install -y ansible
endif

## Install virtualenv and sshpass
ansible-init:
ifeq (${SYSTEM}, Linux)
	@printf "${INFO}sudo apt-get update${EOL}"
	-@sudo apt-get update
	@printf "${INFO}sudo apt-get install -y python-virtualenv${EOL}"
	@sudo apt-get install -y python-virtualenv
	@printf "${INFO}sudo apt-get install -y sshpass${EOL}"
	@sudo apt-get install -y sshpass
endif

## Create ansible user
ansible-adduser:
ifeq (${SYSTEM}, Linux)
	@printf "${INFO}adduser user-ansible${EOL}"
	@adduser user-ansible
	@printf "${INFO}sudo usermod -a -G docker ${USER}${EOL}"
	@sudo usermod -a -G docker ${USER}
endif

## Create ansible virtualenv
ansible-create-virtualenv:
	@printf "${INFO}virtualenv ansible2.7.10${EOL}"
	@virtualenv ansible2.7.10
	@printf "${INFO}source ansible2.7.10/bin/activate${EOL}"
	@source ansible2.7.10/bin/activate

## Install ansible in virtualenv
ansible-install-virtualenv:
	@printf "${INFO}pip install ansible==2.7.10${EOL}"
	@pip install ansible==2.7.10
	@printf "${INFO}ansible --version${EOL}"
	@ansible --version

## List ansible config
ansible-config:
	@printf "${INFO}ansible-config list${EOL}"
	@ansible-config list

