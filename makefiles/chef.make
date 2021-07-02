##################################################
### Chef
##################################################

## Clean chef recipes folder
clean-chef:
	@printf "${INFO}rm -rf ./{{ REPOSITORY }}/* ./{{ REPOSITORY }}/.git* ./{{ REPOSITORY }}/.kitchen.yml${NL}"
	rm -rf ./{{ REPOSITORY }}/* ./{{ REPOSITORY }}/.git* ./{{ REPOSITORY }}/.kitchen.yml

## Clone {{ REPOSITORY }} git project
git-clone: clean-chef
	@printf "${INFO}git clone git@{{ GIT_SERVER }}:{{ GIT_USER }}/{{ REPOSITORY }}.git ./{{ REPOSITORY }}${NL}"
	git clone git@{{ GIT_SERVER }}:{{ GIT_USER }}/{{ REPOSITORY }}.git ./{{ REPOSITORY }}

## Build chef cookbooks
build-cookbooks:
	@printf "${INFO}cd {{ REPOSITORY }} && berks vendor cookbooks${NL}"
	cd {{ REPOSITORY }} && berks vendor cookbooks

## Untar default chef (when you can't build the cookbooks on your machine)
untar-{{ REPOSITORY }}:
	@printf "${INFO}tar -xvzf {{ REPOSITORY }}.tar.gz${NL}"
	tar -xvzf {{ REPOSITORY }}.tar.gz

