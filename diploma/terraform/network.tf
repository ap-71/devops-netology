data "yandex_client_config" "me" {}

# Создаем сеть
resource "yandex_vpc_network" "binrm-net" {
  name = "binrm"
}

# Создаем правило маршрутизации
resource "yandex_vpc_route_table" "nat-int" {
  network_id = "${yandex_vpc_network.binrm-net.id}"

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = var.ingress_ip
  }
}

# Создаем подсети
resource "yandex_vpc_subnet" "binrm-subnet-a" {
  v4_cidr_blocks = ["10.0.0.0/24"]
  zone           = "${var.zone}a"
  network_id     = "${yandex_vpc_network.binrm-net.id}"
  route_table_id = "${yandex_vpc_route_table.nat-int.id}"
}

resource "yandex_vpc_subnet" "binrm-subnet-b" {
  v4_cidr_blocks = ["10.0.1.0/24"]
  zone           = "${var.zone}b"
  network_id     = "${yandex_vpc_network.binrm-net.id}"
  route_table_id = "${yandex_vpc_route_table.nat-int.id}"
}

