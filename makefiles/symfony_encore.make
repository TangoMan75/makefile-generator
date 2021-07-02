##############################################
### Webpack Encore
##############################################

## Build assets for production
encore:
	@printf "${INFO}node yarn build${NL}"
	@node yarn build

