# публичная DNS зона
resource "yandex_dns_zone" "binrm-zone" {
  name             = "binrm-public-zone"
  zone             = "${var.fqdn}."
  public           = true
}

# основная A-запись
resource "yandex_dns_recordset" "rs1" {
  zone_id = yandex_dns_zone.binrm-zone.id
  name    = "${var.fqdn}."
  type    = "A"
  ttl     = 600
  data    = [yandex_compute_instance.nginx[0].network_interface[0].nat_ip_address]
  depends_on = [yandex_compute_instance.nginx]
}

# A-записи для доменов 3 уровня
resource "yandex_dns_recordset" "rs2" {
  zone_id = yandex_dns_zone.binrm-zone.id
  name    = "www"
  type    = "A"
  ttl     = 600
  data    = [yandex_compute_instance.nginx[0].network_interface[0].nat_ip_address]
  depends_on = [yandex_compute_instance.nginx]
}

resource "yandex_dns_recordset" "rs3" {
  zone_id = yandex_dns_zone.binrm-zone.id
  name    = "gitlab"
  type    = "A"
  ttl     = 600
  data    = [yandex_compute_instance.nginx[0].network_interface[0].nat_ip_address]
  depends_on = [yandex_compute_instance.nginx]
}

resource "yandex_dns_recordset" "rs4" {
  zone_id = yandex_dns_zone.binrm-zone.id
  name    = "grafana"
  type    = "A"
  ttl     = 600
  data    = [yandex_compute_instance.nginx[0].network_interface[0].nat_ip_address]
  depends_on = [yandex_compute_instance.nginx]
}

resource "yandex_dns_recordset" "rs5" {
  zone_id = yandex_dns_zone.binrm-zone.id
  name    = "prometheus"
  type    = "A"
  ttl     = 600
  data    = [yandex_compute_instance.nginx[0].network_interface[0].nat_ip_address]
  depends_on = [yandex_compute_instance.nginx]
}

resource "yandex_dns_recordset" "rs6" {
  zone_id = yandex_dns_zone.binrm-zone.id
  name    = "alertmanager"
  type    = "A"
  ttl     = 600
  data    = [yandex_compute_instance.nginx[0].network_interface[0].nat_ip_address]
  depends_on = [yandex_compute_instance.nginx]
}
