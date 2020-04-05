variable public_key_path {
  # Описание переменной
  description = "~/.ssh/appuser.pub"
  default     = "~/.ssh/appuser"
}


variable zone {
  description = "zone"
  # Значение по умолчанию
  default = "europe-west1-b"

}


variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
