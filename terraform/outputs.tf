output "network_id" {
  value = yandex_vpc_network.main.id
}

output "subnet_a_id" {
  value = yandex_vpc_subnet.a.id
}

output "subnet_b_id" {
  value = yandex_vpc_subnet.b.id
}

output "subnet_d_id" {
  value = yandex_vpc_subnet.d.id
}

output "registry_id" {
  value = yandex_container_registry.main.id
}
output "k8s_cluster_id" {
  value = yandex_kubernetes_cluster.main.id
}

output "k8s_cluster_name" {
  value = yandex_kubernetes_cluster.main.name
}
