##############################################
### Nginx Docker
##############################################

## Validate nginx configuration
validate:
# 	@printf "${INFO}docker-compose exec nginx sh -c \"nginx -c /etc/nginx/nginx.conf -t\"${NL}"
# 	@docker-compose exec nginx sh -c "nginx -c /etc/nginx/nginx.conf -t"
	@printf "${INFO}docker-compose exec nginx sh -c \"nginx -t\"${NL}"
	@docker-compose exec nginx sh -c "nginx -t"

