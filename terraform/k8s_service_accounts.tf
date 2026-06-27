resource "yandex_iam_service_account" "k8s_cluster" {
  name        = "${var.project_name}-k8s-cluster-sa"
  description = "Service account for Kubernetes cluster"
}

resource "yandex_iam_service_account" "k8s_nodes" {
  name        = "${var.project_name}-k8s-nodes-sa"
  description = "Service account for Kubernetes nodes"
}

resource "yandex_resourcemanager_folder_iam_member" "k8s_cluster_editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.k8s_cluster.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "k8s_nodes_images_puller" {
  folder_id = var.folder_id
  role      = "container-registry.images.puller"
  member    = "serviceAccount:${yandex_iam_service_account.k8s_nodes.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "k8s_nodes_logging_writer" {
  folder_id = var.folder_id
  role      = "logging.writer"
  member    = "serviceAccount:${yandex_iam_service_account.k8s_nodes.id}"
}
