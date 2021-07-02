##################################################
### Python3 Cache
##################################################

## Clear python cache
cache:
	@printf "${INFO}find . -type d -name __pycache__ | xargs rm -rf${NL}"
	@find . -type d -name __pycache__ | xargs rm -rf
	@printf "${INFO}find . -type f -iname \"*.pyc\" -delete${NL}"
	@find . -type f -iname "*.pyc" -delete

