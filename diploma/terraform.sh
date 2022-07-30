echo "===> RUN TERRAFORM"
cd terraform
printf '======> ON PROXY and press ENTER'
read
terraform init -backend-config=backend.conf
terraform workspace new stage
terraform workspace select stage 
terraform plan
printf '======> OFF PROXY and press ENTER'
read
terraform apply -auto-approve
cd ../
