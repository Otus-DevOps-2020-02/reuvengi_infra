variable project {
  description = "inbound-summit-260319"
  default = "inbound-summit-260319"
}
variable region {
  description = "Region"
  # Значение по умолчанию
  default = "europe-west1"

}


variable "custom_labels" {
  description = "A map of custom labels to apply to the resources. The key is the label name and the value is the label value."
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "Name for the load balancer forwarding rule and prefix for supporting resources."
  type        = string
  default     = "ilb-example"
}


variable zone {
  description = "zone"
  # Значение по умолчанию
  default = "europe-west1-b"

}



variable private_key_path {
  description = "~/.ssh/appuser"
    default = "~/.ssh/appuser"
}
variable public_key_path {
  # Описание переменной
  description = "~/.ssh/appuser.pub"
   default = "~/.ssh/appuser"
}
variable disk_image {
  description = "reddit-base"
  default =  "reddit-base"
}
