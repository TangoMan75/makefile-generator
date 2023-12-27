##################################################
### Python3 CLI
##################################################

## Install
install:
	@printf "${INFO}python3 -m pip install --upgrade pip${EOL}"
	@python3 -m pip install --upgrade pip
	@printf "${INFO}python3 -m pip install -r requirements.txt${EOL}"
	@python3 -m pip install -r requirements.txt

## Start app
run:
	@printf "${INFO}python3 ${filename} ${arguments}${EOL}"
	@python3 ${filename} ${arguments}

## Generate requirements.txt
freeze:
	@printf "${INFO}python3 -m pip freeze > requirements.txt${EOL}"
	@python3 -m pip freeze > requirements.txt

