resource "yandex_container_registry" "main" {
  name = "${var.project_name}-registry"
}
