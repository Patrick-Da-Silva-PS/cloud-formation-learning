# AWS CLI profile
# Needs to be run directly in the shell, not as a `make` command, otherwise it doesn't work. 
switch_cli_profile:
	export AWS_PROFILE=polar-squad-sandbox 

# Deployment commands
# Development
create_stack_development:
	sh ./deploy-scripts/create-stack.sh development 

update_stack_development:
	sh ./deploy-scripts/update-stack.sh development

delete_stack_development:
	sh ./deploy-scripts/delete-stack.sh development

# Staging
create_stack_staging:
	sh ./deploy-scripts/create-stack.sh staging

update_stack_staging:
	sh ./deploy-scripts/update-stack.sh staging

delete_stack_staging:
	sh ./deploy-scripts/delete-stack.sh staging

# Production
create_stack_production:
	sh ./deploy-scripts/create-stack.sh production

update_stack_production:
	sh ./deploy-scripts/update-stack.sh production

delete_stack_production:
	sh ./deploy-scripts/delete-stack.sh production

# All
create_stacks:
	make create_stack_development && make create_stack_staging && make create_stack_production

update_stacks:
	make update_stack_development && make update_stack_staging && make update_stack_production

delete_stacks:
	make delete_stack_development && make delete_stack_staging && make delete_stack_production