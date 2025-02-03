##################################################
### Front
##################################################

## Build js and css
build-front: sass concat

## Concat javascript
concat:
	@printf "${INFO}mkdir -p public/js${EOL}"
	@mkdir -p public/js
	@printf "${INFO}cat assets/js/_*.js > public/js/main.js${EOL}"
	@cat assets/js/_*.js > public/js/main.js

## Compile scss
sass:
	@printf "${INFO}sass assets/scss/styles.scss public/css/styles.css${EOL}"
	@sass assets/scss/styles.scss public/css/styles.css

## Watch scss folder
watch:
	@printf "${INFO}sass --watch assets/scss:public/css${EOL}"
	@sass --watch assets/scss:public/css

