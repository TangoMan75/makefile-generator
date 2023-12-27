##############################################
### Nginx Docker
##############################################

## Validate nginx configuration
validate:
# 	@printf "${INFO}docker-compose exec nginx sh -c \"nginx -c /etc/nginx/nginx.conf -t\"${EOL}"
# 	@docker-compose exec nginx sh -c "nginx -c /etc/nginx/nginx.conf -t"
	@printf "${INFO}docker-compose exec nginx sh -c \"nginx -t\"${EOL}"
	@docker-compose exec nginx sh -c "nginx -t"

