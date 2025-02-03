##################################################
### Python3 Cache
##################################################

## Clear python cache
cache:
	@printf "${INFO}find . -type d -name __pycache__ | xargs rm -rf${EOL}"
	@find . -type d -name __pycache__ | xargs rm -rf
	@printf "${INFO}find . -type f -iname \"*.pyc\" -delete${EOL}"
	@find . -type f -iname "*.pyc" -delete

