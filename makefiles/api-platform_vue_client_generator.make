##################################################
### Api Platform Vue Client Generator Local Env
##################################################

## Install developpement dependencies for vue.js
install-env:
	@printf "${INFO}vue init webpack-simple .${EOL}"
	@vue init webpack-simple .
	@printf "${INFO}yarn add vue-router vuex vuex-map-fields babel-plugin-transform-builtin-extend babel-preset-es2015 babel-preset-stage-2 lodash${EOL}"
	@yarn add vue-router vuex vuex-map-fields babel-plugin-transform-builtin-extend babel-preset-es2015 babel-preset-stage-2 lodash
	@printf "${INFO}yarn add bootstrap font-awesome${EOL}"
	@yarn add bootstrap font-awesome

## Open documentation in default browser
doc:
	@printf "${INFO}nohup xdg-open https://api-platform.com/docs/client-generator/vuejs >/dev/null 2>&1${EOL}"
	@nohup xdg-open https://api-platform.com/docs/client-generator/vuejs >/dev/null 2>&1

## Generate code for a exposed resource from Hydra-enabled API entrypoint
generate:
	@printf "${INFO}npx @api-platform/client-generator http://symfony.localhost/api src/ --generator vue --resource tag${EOL}"
	@npx @api-platform/client-generator http://symfony.localhost/api src/ --generator vue --resource tag
