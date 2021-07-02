##################################################
### Docker Network
##################################################

## Create "tango" network
network:
	@printf "${INFO}docker network create tango${NL}"
	-@docker network create tango

## Remove "tango" network
remove-network:
	@printf "${INFO}docker network rm tango${NL}"
	@docker network rm tango

# print network information
network-info:
	@printf "${INFO}docker network inspect ${network}${NL}"
	@docker network inspect ${network}

## Enable bridge and port forwarding on host
bridge:
	@if [ -z "$(shell brctl --version 2>/dev/null)" ]; then \
		printf "${INFO}sudo apt-get update${NL}"; \
		sudo apt-get update; \
		printf "${INFO}sudo apt-get install -y bridge-utils${NL}"; \
		sudo apt-get install -y bridge-utils; \
	fi
	@printf "${INFO}sysctl net.ipv4.conf.all.forwarding=1${NL}"
	@sysctl net.ipv4.conf.all.forwarding=1
	@printf "${INFO}iptables -P FORWARD ACCEPT${NL}"
	@iptables -P FORWARD ACCEPT

## Create macvlan on guest
macvlan:
	@printf "${INFO}docker network create -d macvlan --subnet=192.168.1.1/24 --gateway=192.168.1.254 -o parent=${adapter} macvlan${NL}"
	@docker network create -d macvlan --subnet=192.168.1.1/24 --gateway=192.168.1.254 -o parent=${adapter} macvlan

