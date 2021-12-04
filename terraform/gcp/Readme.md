# check the terraform template using plan command
terraform plan --var-file=dev.tfvars 

# create resources using terraform apply 
terraform apply --var-file=dev.tfvars

# delete resources using terraform destroy
terraform destroy --var-file=dev.tfvars 
