##################################################
### Front
##################################################

## Build js and css
build-front: sass concat

## Concat javascript
concat:
	@printf "${INFO}mkdir -p public/js${NL}"
	@mkdir -p public/js
	@printf "${INFO}cat assets/js/_*.js > public/js/main.js${NL}"
	@cat assets/js/_*.js > public/js/main.js

## Compile scss
sass:
	@printf "${INFO}sass assets/scss/styles.scss public/css/styles.css${NL}"
	@sass assets/scss/styles.scss public/css/styles.css

## Watch scss folder
watch:
	@printf "${INFO}sass --watch assets/scss:public/css${NL}"
	@sass --watch assets/scss:public/css

