#--------------------------------------------------
# Colors
#--------------------------------------------------

PRIMARY   = \033[97m
SECONDARY = \033[94m
SUCCESS   = \033[32m
DANGER    = \033[31m
WARNING   = \033[33m
INFO      = \033[95m
LIGHT     = \033[47;90m
DARK      = \033[40;37m
DEFAULT   = \033[0m
NL        = \033[0m\n

#--------------------------------------------------
# Color Functions
#--------------------------------------------------

define echo_primary
	@printf "${PRIMARY}%b${NL}" $(1)
endef
define echo_secondary
	@printf "${SECONDARY}%b${NL}" $(1)
endef
define echo_success
	@printf "${SUCCESS}%b${NL}" $(1)
endef
define echo_danger
	@printf "${DANGER}%b${NL}" $(1)
endef
define echo_warning
	@printf "${WARNING}%b${NL}" $(1)
endef
define echo_info
	@printf "${INFO}%b${NL}" $(1)
endef
define echo_light
	@printf "${LIGHT}%b${NL}" $(1)
endef
define echo_dark
	@printf "${DARK}%b${NL}" $(1)
endef

