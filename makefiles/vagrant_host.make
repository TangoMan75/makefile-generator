####################################################
### Vagrant Host
####################################################

## Install vagrant host (Ansible, VirtualBox & Vagrant)
install:
	@bash ./bin/host/install_ansible.sh
	@bash ./bin/host/install_nfs.sh
	@bash ./bin/host/install_vagrant.sh
	@bash ./bin/host/install_vagrant_plugins.sh
	@bash ./bin/host/install_virtualbox-6.0.sh
	@bash ./bin/tools/check_install.sh

## Install vagrant host (Ansible, VirtualBox & Vagrant) from sh files
install-bin:
	@bash ./bin/host/install_ansible.sh
	@bash ./bin/host/install_nfs.sh
	@bash ./bin/host/install_vagrant.sh
	@bash ./bin/host/install_vagrant_plugins.sh
	@bash ./bin/host/install_virtualbox-6.0.sh
	@bash ./bin/tools/check_install.sh

## Uninstall all
uninstall:
	@bash ./bin/host/uninstall_all.sh

## Check installation
check:
	@bash ./bin/tools/check_install.sh

