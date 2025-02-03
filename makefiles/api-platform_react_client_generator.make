##################################################
### Api Platform React Client Generator Local Env
##################################################

## Install developpement dependencies for react.js
install-env:
	@printf "${INFO}npx create-react-app .${EOL}"
	@npx create-react-app .
	@printf "${INFO}yarn add redux react-redux redux-thunk redux-form react-router-dom connected-react-router prop-types lodash${EOL}"
	@yarn add redux react-redux redux-thunk redux-form react-router-dom connected-react-router prop-types lodash
	@printf "${INFO}yarn add bootstrap font-awesome${EOL}"
	@yarn add bootstrap font-awesome

## Open documentation in default browser
doc:
	@printf "${INFO}nohup xdg-open https://api-platform.com/docs/client-generator/react >/dev/null 2>&1${EOL}"
	@nohup xdg-open https://api-platform.com/docs/client-generator/react >/dev/null 2>&1

## Generate code for a exposed resource from Hydra-enabled API entrypoint
generate:
	@printf "${INFO}npx @api-platform/client-generator http://symfony.localhost/api src/${EOL}"
	@npx @api-platform/client-generator http://symfony.localhost/api src/

