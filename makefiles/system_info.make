##################################################
### System Info
##################################################

## Print system information
sysinfo:
	@printf "${INFO}whoami${EOL}"
	@whoami
	@printf "${INFO}id --user${EOL}"
	@id --user
	@printf "${INFO}id --groups --name${EOL}"
	@id --groups --name
	@printf "${INFO}id --groups${EOL}"
	@id --groups
	@if [ -n "$(shell lsb_release -a 2>/dev/null)" ]; then \
		printf "${INFO}lsb_release -a${EOL}"; \
		lsb_release -a; \
	else \
		printf "${WARNING}\"lsb_release\" not available${EOL}"; \
	fi
	@if [ -n "$(shell uname -a 2>/dev/null)" ]; then \
		printf "${INFO}uname -a${EOL}"; \
		uname -a; \
	else \
		printf "${WARNING}\"uname\" not available${EOL}"; \
	fi
	@if [ -n "$(shell hostname 2>/dev/null)" ]; then \
		printf "${INFO}hostname -i${EOL}"; \
		hostname -i; \
		printf "${INFO}hostname -I${EOL}"; \
		hostname -I; \
	else \
		printf "${WARNING}\"hostname\" not available${EOL}"; \
	fi
	@if [ -n "$(shell ip -V 2>/dev/null)" ]; then \
		printf "${INFO}ip addr${EOL}"; \
		ip addr; \
	else \
		printf "${WARNING}\"ip\" not available${EOL}"; \
	fi
	@if [ -n "$(shell ifconfig 2>/dev/null)" ]; then \
		printf "${INFO}ifconfig${EOL}"; \
		ifconfig; \
	else \
		printf "${WARNING}\"ifconfig\" not available${EOL}"; \
	fi
	@if [ -n "$(shell netstat 2>/dev/null)" ]; then \
		printf "${INFO}netstat -tulpn${EOL}"; \
		netstat -tulpn; \
	else \
		printf "${WARNING}\"netstat\" not available${EOL}"; \
	fi
	@if [ -n "$(shell lshw 2>/dev/null)" ]; then \
		printf "${INFO}lshw -short${EOL}"; \
		lshw -short; \
	else \
		printf "${WARNING}\"lshw\" not available${EOL}"; \
	fi
	@if [ -n "$(shell df 2>/dev/null)" ]; then \
		printf "${INFO}df -h | grep -vP \"/dev/loop\d+\"${EOL}"; \
		df -h | grep -vP "/dev/loop\d+"; \
	else \
		printf "${WARNING}\"df\" not available${EOL}"; \
	fi
	@if [ -n "$(shell service 2>/dev/null)" ]; then \
		printf "${INFO}service --status-all${EOL}"; \
		service --status-all; \
	else \
		printf "${WARNING}\"service\" not available${EOL}"; \
	fi
	@if [ -n "$(shell systemctl 2>/dev/null)" ]; then \
		printf "${INFO}systemctl | grep running | sed -E 's/\s+/ /g' | sed 's/ loaded active running /\t/'${EOL}"; \
		systemctl | grep running | sed -E 's/\s+/ /g' | sed 's/ loaded active running /\t/'; \
	else \
		printf "${WARNING}\"systemctl\" not available${EOL}"; \
	fi

