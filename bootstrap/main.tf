resource "yandex_iam_service_account_static_access_key" "tf_state" {
  service_account_id = "ajeh32bm000kms5se5dm"
  description        = "Static access key for Terraform S3 backend"
}

resource "yandex_storage_bucket" "tf_state" {
  bucket     = var.bucket_name
  access_key = yandex_iam_service_account_static_access_key.tf_state.access_key
  secret_key = yandex_iam_service_account_static_access_key.tf_state.secret_key

  force_destroy = true

  versioning {
    enabled = true
  }
}
