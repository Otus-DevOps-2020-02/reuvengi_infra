
terraform {
  # Версия terraform
   required_version = "> 0.12.0"

  }





provider "google" {
version = "~> 2.15"
project = var.project
region = var.region
}
module "storage-bucket" {
source = "SweetOps/storage-bucket/google"
version = "0.3.1"
# Имена поменяйте на другие
name = "test-xxxxxx"
role_entity = flatten([])


}
output storage-bucket_url {
value = module.storage-bucket.url
}
