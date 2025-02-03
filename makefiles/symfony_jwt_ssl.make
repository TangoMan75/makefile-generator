##############################################
### JWT
##############################################

## Generate JWT key
generate-keys:
	@printf "${INFO}sudo rm -rf ./config/jwt${EOL}"
	-@sudo rm -rf ./config/jwt

	@printf "${INFO}mkdir -p ./config/jwt${EOL}"
	-@mkdir -p ./config/jwt

	@printf "${INFO}echo \"$(shell grep ^JWT_PASSPHRASE .env | cut -f 2 -d=)\" | openssl genpkey -out ./config/jwt/private.pem -pass stdin -aes256 -algorithm rsa -pkeyopt rsa_keygen_bits:4096${EOL}"
	@echo "$(shell grep ^JWT_PASSPHRASE .env | cut -f 2 -d=)" | openssl genpkey -out ./config/jwt/private.pem -pass stdin -aes256 -algorithm rsa -pkeyopt rsa_keygen_bits:4096

	@printf "${INFO}echo \"$(shell grep ^JWT_PASSPHRASE .env | cut -f 2 -d=)\" | openssl pkey -in ./config/jwt/private.pem -passin stdin -out ./config/jwt/public.pem -pubout${EOL}"
	@echo "$(shell grep ^JWT_PASSPHRASE .env | cut -f 2 -d=)" | openssl pkey -in ./config/jwt/private.pem -passin stdin -out ./config/jwt/public.pem -pubout

