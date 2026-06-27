variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
  default     = "b1g5bqv45d5n8tdbrniv"
}

variable "folder_id" {
  description = "Yandex Cloud Folder ID"
  type        = string
  default     = "b1ghtgo92hqnuj1kv2ao"
}

variable "default_zone" {
  description = "Default Yandex Cloud zone"
  type        = string
  default     = "ru-central1-a"
}

variable "bucket_name" {
  description = "Terraform state bucket name"
  type        = string
  default     = "den-diploma-tf-state"
}
