resource "yandex_kubernetes_cluster" "main" {
  name        = "${var.project_name}-k8s"
  description = "Diploma Kubernetes cluster"

  network_id = yandex_vpc_network.main.id

  master {
    version   = "1.31"
    public_ip = true

    zonal {
      zone      = yandex_vpc_subnet.a.zone
      subnet_id = yandex_vpc_subnet.a.id
    }
  }

  service_account_id      = yandex_iam_service_account.k8s_cluster.id
  node_service_account_id = yandex_iam_service_account.k8s_nodes.id

  release_channel = "STABLE"

  depends_on = [
    yandex_resourcemanager_folder_iam_member.k8s_cluster_editor,
    yandex_resourcemanager_folder_iam_member.k8s_nodes_images_puller,
    yandex_resourcemanager_folder_iam_member.k8s_nodes_logging_writer
  ]
}
