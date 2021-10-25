# Modified
# devops-netology


# Описание
/.gitignore:
1. пустой, в git попадут все файлы.

/terraform/.gitignore:
1. **/.terraform/* - игнорирует файлы во вложенных папках, которые имеют папку .terraform с файлами
2. *.tfstate - игнорирует файлы с расширением .tfstate
3. *.tfstate.* - игнорирует файлы, которые имеют в имени шаблон .tfstate.
4. crash.log - игнорирует файлы с именем и расширением crash.log
5. *.tfvars - игнорирует файлы с расширением .tfvars
6. override.tf - игнорирует файлы с именем и расширением override.tf
7. override.tf.json - игнорирует файлы с именем и расширением override.tf.json
8. *_override.tf - игнорирует файлы с окончанием _override.tf
9. *_override.tf.json - игнорирует файлы с окончанием _override.tf.json
10. .terraformrc - игнорирует папки .terraformrc
11. terraform.rc - игнорирует файлы с именем и расширением terraform.rc
