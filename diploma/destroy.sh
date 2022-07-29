source ./vars.sh

cd ./terraform/
terraform destroy -auto-approve
cd ../
rm -rf wp