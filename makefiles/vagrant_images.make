####################################################
### Vagrant Images
####################################################

## Download Windows7 image from microsoft
download-win7:
	@printf "${INFO}wget https://az792536.vo.msecnd.net/vms/VMBuild_20150916/Vagrant/IE8/IE8.Win7.Vagrant.zip${EOL}"
	@wget https://az792536.vo.msecnd.net/vms/VMBuild_20150916/Vagrant/IE8/IE8.Win7.Vagrant.zip
	-@make --no-print-directory add-win7

## Extract and add downloaded Windows7 image from microsoft
add-win7:
	@printf "${INFO}7z e IE8.Win7.Vagrant.zip${EOL}"
	@7z e IE8.Win7.Vagrant.zip
	@printf "${INFO}rm IE8.Win7.Vagrant.zip${EOL}"
	@rm IE8.Win7.Vagrant.zip
	@printf "${INFO}vagrant box add win7 "./IE8 - Win7.box"${EOL}"
	@vagrant box add win7 "./IE8 - Win7.box"

## Download Mac OSX image from Vagrant
download-osx:
	@printf "${INFO}wget https://vagrant-osx.nyc3.digitaloceanspaces.com/osx-sierra-0.3.1.box${EOL}"
	@wget https://vagrant-osx.nyc3.digitaloceanspaces.com/osx-sierra-0.3.1.box
	-@make --no-print-directory add-osx

## Extract and add downloaded Windows7 image from microsoft
add-osx:
	@printf "${INFO}vagrant box add osx ./osx-sierra-0.3.1.box${EOL}"
	@vagrant box add osx ./osx-sierra-0.3.1.box

