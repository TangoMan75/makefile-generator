##################################################
### Sass
##################################################

## Compile scss
sass:
	@printf "${INFO}sass assets/scss/index.scss public/css/index.css${NL}"
	@sass assets/scss/index.scss public/css/index.css

## Watch scss folder
watch:
	@printf "${INFO}sass --watch assets/scss:public/css${NL}"
	@sass --watch assets/scss:public/css

