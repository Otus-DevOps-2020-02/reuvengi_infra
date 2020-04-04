 module "lb" {
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "github.com/gruntwork-io/terraform-google-load-balancer.git//modules/internal-load-balancer?ref=v0.2.0"
  source = "github.com/gruntwork-io/terraform-google-load-balancer.git//modules/internal-load-balancer?ref=v0.2.0"

  name    = var.name
  region  = var.region
  project = var.project

  backends = [
    {
      description = "Instance group for internal-load-balancer test"
      group       = google_compute_instance_group.api.self_link
    },
  ]

  # This setting will enable internal DNS for the load balancer
  service_label = var.name

  #network    = module.vpc_network.network
  #subnetwork = module.vpc_network.public_subnetwork

  health_check_port = 9292
  http_health_check = false
  target_tags       = [var.name]
  source_tags       = [var.name]
  ports             = ["9292"]

  custom_labels = var.custom_labels
}

resource "google_compute_instance_group" "api" {
  project   = var.project
  name      = "${var.name}-instance-group"
  zone      = var.zone
  instances = [google_compute_instance.app.self_link]

  lifecycle {
    create_before_destroy = true
  }
}
