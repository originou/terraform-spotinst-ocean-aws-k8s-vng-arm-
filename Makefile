init:
	terraform init
apply: init
	terraform apply

destroy: init
	terraform destroy
