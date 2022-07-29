echo "===> RUN TERRAFORM"
cd terraform
terraform workspace new stage
terraform workspace select stage 
printf '======> On proxy and press ENTER'
read
terraform init -backend-config=backend.conf
printf '======> Off proxy and press ENTER'
read
terraform plan
terraform apply -auto-approve
cd ../