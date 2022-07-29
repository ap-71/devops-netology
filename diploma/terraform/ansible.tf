# Ждем поднятия ВМ
resource "null_resource" "wait" {
  provisioner "local-exec" {
    command     = "sleep 300"
  }

  depends_on = [
    local_file.inventory
  ]
}

# Запускаем ansible
resource "null_resource" "ansible" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory.yml ../ansible/play.yml"
  }

  depends_on = [
    null_resource.wait
  ]
}

