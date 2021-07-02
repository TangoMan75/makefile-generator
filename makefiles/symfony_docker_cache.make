##############################################
### Symfony Cache (Docker)
##############################################

## Clean cache
cache:
	@printf "${INFO}docker-compose exec php sh -c \"${CONSOLE} cache:clear --env=${env}\"${NL}"
	@docker-compose exec php sh -c "${CONSOLE} cache:clear --env=${env}"
	@printf "${INFO}docker-compose exec php sh -c \"${CONSOLE} cache:warmup --env=${env}\"${NL}"
	@docker-compose exec php sh -c "${CONSOLE} cache:warmup --env=${env}"
ifeq ($(env),dev)
	@make --no-print-directory own
endif

## Force delete cache
nuke:
	@printf "${INFO}sudo rm -rf ./var/cache${NL}"
	-@sudo rm -rf ./var/cache
	@printf "${INFO}mkdir ./var/cache${NL}"
	@mkdir -p ./var/cache

	@printf "${INFO}sudo rm -rf ./var/log${NL}"
	-@sudo rm -rf ./var/log
	@printf "${INFO}mkdir ./var/log${NL}"
	@mkdir -p ./var/log

	@printf "${INFO}sudo rm -rf /var/cache/symfony/$(shell basename ${CURDIR})${NL}"
	@sudo rm -rf /var/cache/symfony/$(shell basename ${CURDIR})

	@printf "${INFO}sudo rm -rf /var/log/symfony/$(shell basename ${CURDIR})${NL}"
	@sudo rm -rf /var/log/symfony/$(shell basename ${CURDIR})

	@printf "${INFO}sudo rm -rf /var/log/nginx/$(shell basename ${CURDIR})${NL}"
	@sudo rm -rf /var/log/nginx/$(shell basename ${CURDIR})

## Own ./var
own:
ifeq ($(env),prod)
	$(eval OWNER=$(shell whoami))
	$(eval GROUP=$(shell whoami))
else
	$(eval OWNER=nobody)
	$(eval GROUP=nogroup)
endif
	@printf "${INFO}sudo chown -R ${OWNER}:${GROUP} ./var${NL}"
	-@sudo chown -R ${OWNER}:${GROUP} ./var
	@printf "${INFO}sudo chmod 777 -R ./var${NL}"
	-@sudo chmod 777 -R ./var

	@printf "${INFO}sudo chown ${OWNER}:${GROUP} ./var/data.db${NL}"
	-@sudo chown ${OWNER}:${GROUP} ./var/data.db
	@printf "${INFO}sudo chmod 664 ./var/data.db${NL}"
	-@sudo chmod 664 ./var/data.db

	@printf "${INFO}sudo chown ${OWNER}:${GROUP} ./var/dev.db${NL}"
	-@sudo chown ${OWNER}:${GROUP} ./var/dev.db
	@printf "${INFO}sudo chmod 664 ./var/dev.db${NL}"
	-@sudo chmod 664 ./var/dev.db

	@printf "${INFO}sudo chown ${OWNER}:${GROUP} ./var/test.db${NL}"
	-@sudo chown ${OWNER}:${GROUP} ./var/test.db
	@printf "${INFO}sudo chmod 664 ./var/test.db${NL}"
	-@sudo chmod 664 ./var/test.db

