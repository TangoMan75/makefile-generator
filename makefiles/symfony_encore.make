##############################################
### Webpack Encore
##############################################

## Build assets for production
encore:
	@printf "${INFO}node yarn build${EOL}"
	@node yarn build

