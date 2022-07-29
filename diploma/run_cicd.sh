source ./vars_cicd.sh
cat ~/.ssh/id_rsa.pub
echo "press ENTER" 
read
ansible-playbook ./ansible/prepare.yml -i ./ansible/inventory.yml -l app -e "runner_token=$runner_token"
