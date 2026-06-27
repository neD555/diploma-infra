resource "yandex_kubernetes_node_group" "main" {
  cluster_id  = yandex_kubernetes_cluster.main.id
  name        = "${var.project_name}-node-group"
  description = "Diploma Kubernetes worker nodes"
  version     = "1.31"

  instance_template {
    platform_id = "standard-v3"

    network_interface {
      nat = true
      subnet_ids = [
        yandex_vpc_subnet.a.id,
        yandex_vpc_subnet.b.id,
        yandex_vpc_subnet.d.id
      ]
    }

    resources {
      memory = 4
      cores  = 2
    }

    boot_disk {
      type = "network-hdd"
      size = 64
    }

    scheduling_policy {
      preemptible = true
    }
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    location {
      zone = yandex_vpc_subnet.a.zone
    }

    location {
      zone = yandex_vpc_subnet.b.zone
    }

    location {
      zone = yandex_vpc_subnet.d.zone
    }
  }
}
