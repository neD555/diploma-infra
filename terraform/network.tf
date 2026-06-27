resource "yandex_vpc_network" "main" {
  name = "${var.project_name}-network"
}

resource "yandex_vpc_subnet" "a" {
  name           = "${var.project_name}-subnet-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = ["10.10.1.0/24"]
}

resource "yandex_vpc_subnet" "b" {
  name           = "${var.project_name}-subnet-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = ["10.10.2.0/24"]
}

resource "yandex_vpc_subnet" "d" {
  name           = "${var.project_name}-subnet-d"
  zone           = "ru-central1-d"
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = ["10.10.3.0/24"]
}
