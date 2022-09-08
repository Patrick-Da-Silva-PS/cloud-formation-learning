# Needs to be run directly in the shell, not as a `make` command, otherwise it doesn't work. 
switch_cli_profile:
	export AWS_PROFILE=polar-squad-sandbox 

create_stack_development:
	sh ./deploy-scripts/create-stack.sh development

update_stack_development:
	sh ./deploy-scripts/update-stack.sh development

delete_stack_development:
	sh ./deploy-scripts/delete-stack.sh development