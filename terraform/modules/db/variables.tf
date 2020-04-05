variable public_key_path {
  # Описание переменной
  description = "~/.ssh/appuser.pub"
  default     = "~/.ssh/appuser"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

variable zone {
  description = "zone"
  # Значение по умолчанию
  default = "europe-west1-b"
}
