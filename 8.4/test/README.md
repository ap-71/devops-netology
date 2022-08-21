## Тест коллекции my_own_collection с модулем my_own_module.py

Репозиторий с коллекцией:

https://github.com/panarin0290/my_own_collection

Для установки коллекции необходимо в дирректории `playbook` запустить:

```bash
ansible-galaxy install -r requirements.yml
```

Для запуска playbook:

```bash
ansible-playbook site.yml -i inventories/prod/hosts.yml
```
