##################################################
### Python Virtualenv
##################################################

## Start
venv-run:
ifeq ($(shell test -f ${virtualenv}/bin/python && echo true),true)
	@printf "${INFO}venv/bin/python ${filename}${NL}"
	@venv/bin/python ${filename}
else
	@printf "${DANGER}error: virtualenv not found${NL}"
	@exit 1
endif

## Create virtualenv
venv-create: venv-remove
	@printf "${INFO}virtualenv -p python3 ${virtualenv}${NL}"
	@virtualenv -p python3 ${virtualenv}
	-@make --no-print-directory venv-start
	-@make --no-print-directory venv-install

## Activate virtualenv
venv-start:
ifeq ($(shell test -f ${virtualenv}/bin/activate && echo true),true)
	@printf "${INFO}source ${virtualenv}/bin/activate${NL}"
	@source ${virtualenv}/bin/activate
else
	@printf "${DANGER}error: virtualenv not found${NL}"
	@exit 1
endif

## Deactivate virtualenv
venv-stop:
	@printf "${INFO}bash -c \"source ${virtualenv}/bin/activate && deactivate\"${NL}"
	-@bash -c "source ${virtualenv}/bin/activate && deactivate"

## Run tests from virtualenv
venv-tests:
ifeq ($(shell test -f ${virtualenv}/bin/python && echo true),true)
	@printf "${INFO}venv/bin/python -m unittest -v tests/*.py${NL}"
	@venv/bin/python -m unittest -v tests/*.py
else
	@printf "${DANGER}error: virtualenv not found${NL}"
	@exit 1
endif

## Install in virtualenv
venv-install:
ifeq ($(shell test -f ${virtualenv}/bin/pip && echo true),true)
	@printf "${INFO}${virtualenv}/bin/pip install -r requirements.txt${NL}"
	@${virtualenv}/bin/pip install -r requirements.txt
else
	@printf "${DANGER}error: virtualenv not found${NL}"
	@exit 1
endif

## Remove virtualenv
venv-remove: venv-stop
	@printf "${INFO}rm -rf ${virtualenv}${NL}"
	@rm -rf ${virtualenv}
	@printf "${INFO}rm -rf __pycache__${NL}"
	@rm -rf __pycache__

