output "app_external_ip" {
  value = google_compute_instance.app.network_interface[0].access_config[0].nat_ip
}

output "load_balancer_ip_address" {
  description = "Internal IP address of the load balancer"
  value       = module.lb.load_balancer_ip_address
}

output "load_balancer_domain_name" {
  description = "Internal domain name of the load balancer"
  value       = module.lb.load_balancer_domain_name
}
