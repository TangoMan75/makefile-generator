##################################################
### Sass
##################################################

## Compile scss
sass:
	@printf "${INFO}sass assets/scss/index.scss public/css/index.css${EOL}"
	@sass assets/scss/index.scss public/css/index.css

## Watch scss folder
watch:
	@printf "${INFO}sass --watch assets/scss:public/css${EOL}"
	@sass --watch assets/scss:public/css

