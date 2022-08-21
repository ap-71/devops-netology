запуск без инвентори
ansible-playbook 1.yml
ansible-playbook 1.yml -i inventory/prod.yml
ansible-playbook 1.yml --tags two # запустить по только с тегом two
ansible-playbook 1.yml --tags common
ansible-playbook 1.yml --skip-tags common
Запустить без тегов
 ansible-playbook 1.yml --tags untagged
Запустить тегированные таски
ansible-playbook 1.yml --tags tagged
ansible-playbook 1.yml --tags tagged,never,untagged
Запустить на все интвернори, кроме локалхост. Можно указать имя группы

 ansible-playbook 1.yml -i inventory/prod.yml --limit '!localhost'
