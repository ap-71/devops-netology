#Токен доступа к yandex.cloud
variable "token" {
  type      = string
  sensitive = true
}

#ID облака
variable "cloud_id" {
  type    = string
}

#ID каталога
variable "folder_id" {
  type    = string
}

#Зона доступности
variable "zone" {
  type    = string
  default = "ru-central1-"
}

#Доменное имя
variable "fqdn" {
  type    = string
}

#Фиксированный серый IP
variable "ingress_ip" {
  type    = string
  default = "10.0.0.100"
}

#Параметры ВМ
variable "hosts" {
    type = map(map(map(string)))
    default = {
      stage = {
        vm1 = {
          name = "db01"
          cores = "2"
          memory = "2"
          core_fraction = "20"
        }
        vm2 = {
          name = "db02"
          cores = "2"
          memory = "2"
          core_fraction = "20"
        }
        vm3 = {
          name = "app"
          cores = "2"
          memory = "2"
          core_fraction = "20"
        }
        vm4 = {
          name = "gitlab"
          cores = "2"
          memory = "8"
          core_fraction = "20"
        }
        vm5 = {
          name = "monitoring"
          cores = "2"
          memory = "2"
          core_fraction = "20"
        }

    }
      prod = {
    }
    }
}
