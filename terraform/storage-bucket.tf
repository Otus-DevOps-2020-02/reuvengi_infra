provider "google" {
version = "~> 2.15"
project = var.project
region = var.region
}
module "storage-bucket" {
source = "SweetOps/storage-bucket/google"
version = "0.1.1"
# Имена поменяйте на другие
name = ["test-xxxxxx", "test-xxxxxx2"]
role_entity=[""]
}
output storage-bucket_url {
value = module.storage-bucket.url
}
