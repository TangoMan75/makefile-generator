##################################################
### System Info
##################################################

## Print system information
sysinfo:
	@printf "${INFO}whoami${NL}"
	@whoami
	@printf "${INFO}id --user${NL}"
	@id --user
	@printf "${INFO}id --groups --name${NL}"
	@id --groups --name
	@printf "${INFO}id --groups${NL}"
	@id --groups
	@if [ -n "$(shell lsb_release -a 2>/dev/null)" ]; then \
		printf "${INFO}lsb_release -a${NL}"; \
		lsb_release -a; \
	else \
		printf "${WARNING}\"lsb_release\" not available${NL}"; \
	fi
	@if [ -n "$(shell uname -a 2>/dev/null)" ]; then \
		printf "${INFO}uname -a${NL}"; \
		uname -a; \
	else \
		printf "${WARNING}\"uname\" not available${NL}"; \
	fi
	@if [ -n "$(shell hostname 2>/dev/null)" ]; then \
		printf "${INFO}hostname -i${NL}"; \
		hostname -i; \
		printf "${INFO}hostname -I${NL}"; \
		hostname -I; \
	else \
		printf "${WARNING}\"hostname\" not available${NL}"; \
	fi
	@if [ -n "$(shell ip -V 2>/dev/null)" ]; then \
		printf "${INFO}ip addr${NL}"; \
		ip addr; \
	else \
		printf "${WARNING}\"ip\" not available${NL}"; \
	fi
	@if [ -n "$(shell ifconfig 2>/dev/null)" ]; then \
		printf "${INFO}ifconfig${NL}"; \
		ifconfig; \
	else \
		printf "${WARNING}\"ifconfig\" not available${NL}"; \
	fi
	@if [ -n "$(shell netstat 2>/dev/null)" ]; then \
		printf "${INFO}netstat -tulpn${NL}"; \
		netstat -tulpn; \
	else \
		printf "${WARNING}\"netstat\" not available${NL}"; \
	fi
	@if [ -n "$(shell lshw 2>/dev/null)" ]; then \
		printf "${INFO}lshw -short${NL}"; \
		lshw -short; \
	else \
		printf "${WARNING}\"lshw\" not available${NL}"; \
	fi
	@if [ -n "$(shell df 2>/dev/null)" ]; then \
		printf "${INFO}df -h | grep -vP \"/dev/loop\d+\"${NL}"; \
		df -h | grep -vP "/dev/loop\d+"; \
	else \
		printf "${WARNING}\"df\" not available${NL}"; \
	fi
	@if [ -n "$(shell service 2>/dev/null)" ]; then \
		printf "${INFO}service --status-all${NL}"; \
		service --status-all; \
	else \
		printf "${WARNING}\"service\" not available${NL}"; \
	fi
	@if [ -n "$(shell systemctl 2>/dev/null)" ]; then \
		printf "${INFO}systemctl | grep running | sed -E 's/\s+/ /g' | sed 's/ loaded active running /\t/'${NL}"; \
		systemctl | grep running | sed -E 's/\s+/ /g' | sed 's/ loaded active running /\t/'; \
	else \
		printf "${WARNING}\"systemctl\" not available${NL}"; \
	fi

