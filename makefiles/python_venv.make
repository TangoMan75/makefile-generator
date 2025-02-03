##################################################
### Python Virtualenv
##################################################

## Start
venv-run:
ifeq ($(shell test -f ${virtualenv}/bin/python && echo true),true)
	@printf "${INFO}venv/bin/python ${filename}${EOL}"
	@venv/bin/python ${filename}
else
	@printf "${DANGER}error: virtualenv not found${EOL}"
	@exit 1
endif

## Create virtualenv
venv-create: venv-remove
	@printf "${INFO}virtualenv -p python3 ${virtualenv}${EOL}"
	@virtualenv -p python3 ${virtualenv}
	-@make --no-print-directory venv-start
	-@make --no-print-directory venv-install

## Activate virtualenv
venv-start:
ifeq ($(shell test -f ${virtualenv}/bin/activate && echo true),true)
	@printf "${INFO}source ${virtualenv}/bin/activate${EOL}"
	@source ${virtualenv}/bin/activate
else
	@printf "${DANGER}error: virtualenv not found${EOL}"
	@exit 1
endif

## Deactivate virtualenv
venv-stop:
	@printf "${INFO}bash -c \"source ${virtualenv}/bin/activate && deactivate\"${EOL}"
	-@bash -c "source ${virtualenv}/bin/activate && deactivate"

## Run tests from virtualenv
venv-tests:
ifeq ($(shell test -f ${virtualenv}/bin/python && echo true),true)
	@printf "${INFO}venv/bin/python -m unittest -v tests/*.py${EOL}"
	@venv/bin/python -m unittest -v tests/*.py
else
	@printf "${DANGER}error: virtualenv not found${EOL}"
	@exit 1
endif

## Install in virtualenv
venv-install:
ifeq ($(shell test -f ${virtualenv}/bin/pip && echo true),true)
	@printf "${INFO}${virtualenv}/bin/pip install -r requirements.txt${EOL}"
	@${virtualenv}/bin/pip install -r requirements.txt
else
	@printf "${DANGER}error: virtualenv not found${EOL}"
	@exit 1
endif

## Remove virtualenv
venv-remove: venv-stop
	@printf "${INFO}rm -rf ${virtualenv}${EOL}"
	@rm -rf ${virtualenv}
	@printf "${INFO}rm -rf __pycache__${EOL}"
	@rm -rf __pycache__

