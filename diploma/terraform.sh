echo "===> RUN TERRAFORM"
cd terraform
printf '======> On proxy and press ENTER'
read
terraform init -backend-config=backend.conf
terraform workspace new stage
terraform workspace select stage 
terraform plan
terraform apply -auto-approve
cd ../
